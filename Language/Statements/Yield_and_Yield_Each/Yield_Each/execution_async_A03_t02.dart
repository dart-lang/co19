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
/// paused, then execution of `m` is suspended until `u` is resumed. Using
/// `Completer` to control generator execution before `yield*` statement.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator(Stream<int> input, Future startTrigger) async* {
  await startTrigger;
  yield* input;
}

Future test() async {
  List log = [];
  Completer c = new Completer();
  Stream<int> s = generator(new Stream.fromIterable([1, 2, 3]), c.future);
  StreamSubscription<int> ss = s.listen((int i) {
    log.add(i);
  }, onDone: () {
    Expect.listEquals(['a', 'b', 'c', 1, 2, 3], log);
    asyncEnd();
  });
  ss.pause();
  c.complete(); // Return control to yield*
  log.add('a');
  await null;
  log.add('b');
  await null;
  log.add('c');
  ss.resume();
}

main() {
  asyncStart();
  test();
}
