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
/// @description Check that the immediately enclosing function terminates and
/// 'finally' handler is executed, if the stream u associated with m has been
/// canceled.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

bool cancelHandled = false;

Stream<int> generator() async* {
  bool canceled = false;
  int i = 0;
  while (true) {
    try {
      canceled = true;
      yield i++;
      canceled = false;
    } finally {
      if (canceled) {
        cancelHandled = true;
      }
    }
  }
}

test() async {
  Stream<int> s = generator();
  late StreamSubscription<int> ss;
  cancelHandled = false;
  ss = s.listen(
      (int x) async {
        Expect.equals(false, cancelHandled);
        if (x == 5) { // let generator to work some time
          await ss.cancel();
          Expect.equals(true, cancelHandled);
          asyncEnd();
        }
      }
  );
}

main() {
  asyncStart();
  test();
}
