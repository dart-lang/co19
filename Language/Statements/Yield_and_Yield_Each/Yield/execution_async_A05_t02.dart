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
/// @description Check behavior of `yield` when generator function is iterated
/// by `await for` loop
///
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../../Utils/expect.dart';

List<int> readyToSend = [];
List<int> sent = [];

Stream<int> generator() async* {
  for (int i = 1; i <= 5; i++) {
    readyToSend.add(i);
    yield i;
    sent.add(i);
  }
}

main() async {
  List<int> received = [];
  Stream<int> stream = generator();
  await for (int i in stream) {
    received.add(i);
    Expect.listEquals([for (var j = 1; j <= i; j++) j], received);
    Expect.listEquals([for (var j = 1; j <= i - 1; j++) j], sent);
    Expect.listEquals([for (var j = 1; j <= i; j++) j], readyToSend);
    await Future.delayed(Duration(milliseconds: 100));
    Expect.listEquals([for (var j = 1; j <= i; j++) j], received);
    Expect.listEquals([for (var j = 1; j <= i - 1; j++) j], sent);
    Expect.listEquals([for (var j = 1; j <= i; j++) j], readyToSend);
  }
  Expect.listEquals([1, 2, 3, 4, 5], received);
  Expect.listEquals([1, 2, 3, 4, 5], sent);
  Expect.listEquals([1, 2, 3, 4, 5], readyToSend);
}
