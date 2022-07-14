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
/// @description Check that object o is added to stream associated with the
/// immediately enclosing function.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator(Iterable<int> iterable) async* {
  for (var o in iterable) {
    yield o;
  }
}

test() async {
  List<int> data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<int> log = [];
  Stream<int> s = generator(data);
  s.listen(
      (int x) =>  log.add(x),
      onDone:() {
        Expect.listEquals(data, log);
        asyncEnd();
      }
  );
}

main() {
  asyncStart();
  test();
}
