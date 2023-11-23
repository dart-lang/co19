// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If `m` is marked `async*`, then:
///   • It is a dynamic error if the class of o does not implement `Stream<T>`.
///  Otherwise
///   • The nearest enclosing asynchronous for loop, if any, is paused.
///   • The `o` stream is listened to, creating a subscription `s`, and for each
///    event `x`, or error `e` with stack trace `t`, of `s`:
///      – If the stream `u` associated with `m` has been paused, then execution
///         of `m` is suspended until `u` is resumed or canceled.
///      – If the stream `u` associated with `m` has been canceled, then `s` is
///      canceled by evaluating `await v.cancel()` where `v` is a fresh variable
///      referencing the stream subscription `s`. Then, if the cancel completed
///      normally, the stream execution of `s` returns without an object.
///      – Otherwise, `x`, or `e` with `t`, are added to the stream associated
///      with `m` in the order they appear in `o`. Note that a dynamic error
///      occurs if `x` is added and the dynamic type of `x` is not a subtype of
///      the element type of said stream. The function `m` may suspend.
///   • If the stream `o` is done, execution of `s` completes normally.
///
/// @description Check that if the stream `u` associated with `m` has been
/// canceled and there is an enclosing `try finally` statement, the `finally`
/// clause is executed.
///
/// @issue 25748, 34775
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

bool cancelHandled = false;

Stream<int> generator(Stream<int> input) async* {
  bool cancelled = true;
  try {
    // The `yield*` works as a `return;` when `input` is canceled.
    yield* input;
    cancelled = false;
  } catch(e) {
    Expect.fail("Unexpected error $e");
  } finally {
    if (cancelled) {
      cancelHandled = true;
    }
  }
}

Future test() async {
  Completer c = Completer();
  List log = [];
  StreamController<int> sc = new StreamController<int>();
  Stream<int> s = generator(sc.stream);
  StreamSubscription<int> ss = s.listen((int i) {
    log.add(i);
    if (i == 3) {
      c.complete();
    }
  });
  sc.add(1);
  sc.add(2);
  sc.add(3);
  await c.future;
  await ss.cancel();
  sc.add(4);
  sc.add(5);
  // Give events that should not be delivered chance to be erroneously delivered
  await new Future.delayed(new Duration(milliseconds: 100));
  Expect.listEquals([1, 2, 3], log);
  Expect.isTrue(cancelHandled);
  await sc.close();
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}
