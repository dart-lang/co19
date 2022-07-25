// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Execution of a statement s of the form yield e; proceeds as
/// follows:
///   First, the expression `e` is evaluated to an object `o`. If the enclosing
/// function `m` is marked `async*` and the stream `u` associated with `m` has
/// been paused, then the nearest enclosing asynchronous `for` loop if any, is
/// paused and execution of `m` is suspended until `u` is resumed or canceled.
///   Next, `o` is added to the iterable or stream associated with the
/// immediately enclosing function.
///   If the enclosing function `m` is marked `async*` and the stream `u`
/// associated with `m` has been canceled, then the `yield` statement returns
/// without an object, otherwise it completes normally.
///   Otherwise, if the enclosing function `m` is marked `async*` then the
/// enclosing function may suspend, in which case the nearest enclosing
/// asynchronous `for` loop, if any, is paused first.
///
/// @description Check that if the enclosing function `m` is marked `async*` and
/// the stream `u` associated with `m` has been paused, then the nearest
/// enclosing asynchronous `for` loop is paused and execution of `m` is
/// suspended until `u` is resumed
///
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../../Utils/expect.dart';

List<int> readyToSend = [];
List<int> sent = [];

Stream<int> generator(Stream<int> input) async* {
  await for (var v in input) {
    readyToSend.add(v);
    yield v;
    sent.add(v);
  }
}

main() {
  asyncStart();
  List received = [];
  StreamController<int> sc = StreamController<int>();
  Stream<int> s = generator(sc.stream);
  late StreamSubscription<int> ss;
  ss = s.listen((int i) async {
    received.add(i);
    if (i == 2) {
      ss.pause();
      await Future.delayed(Duration(milliseconds: 100));
      Expect.listEquals([1], sent);
      Expect.listEquals([1, 2], readyToSend);
      Expect.isTrue(sc.isPaused);
      ss.resume();
      await Future.delayed(Duration(milliseconds: 100));
      // `sent` may contain not all elements of the stream
      sent.forEach((element) {
        Expect.isTrue([1, 2, 3].contains(element));
      });
    }
    if (i == 3) {
      sc.close();
    }
  }, onDone: () {
    Expect.listEquals([1, 2, 3], received);
    Expect.listEquals(sent, received);
    Expect.listEquals(readyToSend, received);
    asyncEnd();
  });
  sc.add(1);
  sc.add(2);
  sc.add(3);
}
