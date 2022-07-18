// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
/// @description Check that the immediately enclosing function m may suspend
/// to give an opportunity for asynchronous consumers to drain the stream. Test
/// the case when listening function is async
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

bool finish = false;

Stream<int> generator() async* {
  int i = 0;
  while (!finish) {
    yield i++;
  }
}

test() async {
  finish = false;
  Stream<int> s = generator();
  s.listen((int x) async {
    finish = (x > 10); // let generator to work some time
  }, onDone: () {
    asyncEnd();
  });
}

main() {
  asyncStart();
  test();
}
