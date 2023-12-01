// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
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
/// @description Check that if an error is added to the stream it appears in it
///
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator(Stream<int> input) async* {
  yield -1;
  yield* input;
  yield 10;
}

Future test() async {
  Completer c = Completer();
  List log = [];
  bool errorProcessed = false;
  StreamController<int> sc = new StreamController<int>();
  Stream<int> s = generator(sc.stream);
  late StreamSubscription<int> ss;
  ss = s.listen((int i) {
    log.add(i);
    if (!c.isCompleted) {
      c.complete();
    }
  }, onDone: () {
    Expect.listEquals([-1, 1, 'one', 2, 'two', 10], log);
    Expect.isTrue(errorProcessed);
    asyncEnd();
  }, onError: (e) {
    Expect.equals("Error!!", e);
    Expect.listEquals([-1, 1, 'one'], log);
    errorProcessed = true;
    c.complete();
  });
  await c.future;
  c = Completer();
  sc.add(1);
  await c.future;
  log.add('one');
  c = Completer();
  sc.addError("Error!!");
  await c.future;
  c = Completer();
  sc.add(2);
  await c.future;
  log.add('two');
  await sc.close();
  asyncEnd();
}

main() {
  asyncStart(2);
  test();
}
