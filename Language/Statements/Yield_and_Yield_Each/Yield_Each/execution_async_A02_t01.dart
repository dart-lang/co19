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
/// @description Check that if there is an enclosing asynchronous for loop, it
/// is paused
///
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<Object> generator(Stream<int> input1, Stream<String> input2) async* {
  await for (var v in input1) {
    yield v;
    if (v == 2) {
      yield* input2;
    }
  }
}

Future test() async {
  List log = [];
  Stream<String> input2 = Stream<String>.fromIterable(['a', 'b', 'c']);
  StreamController<int> sc = new StreamController<int>();
  Stream<Object> s = generator(sc.stream, input2);
  StreamSubscription<Object> ss = s.listen((Object o) {
    log.add(o);
    if (o is String) {
      Expect.isTrue(sc.isPaused);
    }
  }, onDone: () {
    Expect.listEquals([1, 2, 'a', 'b', 'c', 3], log);
    asyncEnd();
  });
  sc.add(1);
  await new Future.delayed(new Duration(milliseconds: 100));
  sc.add(2);
  await new Future.delayed(new Duration(milliseconds: 100));
  sc.add(3);
  await new Future.delayed(new Duration(milliseconds: 100));
  ss.resume();
  sc.close();
}

main() {
  asyncStart();
  test();
}
