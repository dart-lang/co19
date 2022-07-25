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
/// enclosing 'finally' handlers are executed in innermost-first order, if the
/// stream u associated with m has been canceled.
///
/// @issue #25539
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator(List<int> log) async* {
  bool canceled = false;
  int i = 0;
  int order = 0;
  try {
    while (true) {
      try {
        canceled = true;
        try {
          yield i++;
          canceled = false;
        } finally {
          if (canceled) {
            log.add(order++);
          }
        }
      } finally {
        if (canceled) {
          log.add(order++);
        }
      }
    }
  } finally {
    if (canceled) {
      log.add(order++);
    }
  }
}

test() async {
  List<int> log = [];
  Stream<int> s = generator(log);
  late StreamSubscription<int> ss;
  ss = s.listen(
      (int x) async {
        if (x == 5) { //  Allow the generator to work for some time.
          await ss.cancel();
          Expect.listEquals([0, 1, 2], log);
          asyncEnd();
        }
      }
  );
}

main() {
  asyncStart();
  test();
}
