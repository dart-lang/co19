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
/// canceled and there is no enclosing `try finally` statement, the immediately
/// enclosing function terminates.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator(Stream<int> input) async* {
  yield* input;
}

Future test() async {
  List log = [];
  var data = new Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  Stream<int> s = generator(data);
  late StreamSubscription<int> ss;
  ss = s.listen((int i) async {
    log.add(i);
    if (i == 5) {
      ss.cancel();

      Expect.listEquals([1, 2, 3, 4, 5], log);
      await new Future.delayed(new Duration(milliseconds: 100));
      Expect.listEquals([1, 2, 3, 4, 5], log);
      await new Future.delayed(new Duration(milliseconds: 100));
      Expect.listEquals([1, 2, 3, 4, 5], log);
      asyncEnd();
    }
  });
}

main() {
  asyncStart();
  test();
}
