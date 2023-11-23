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
/// @description Check that if the enclosing function `m` is marked `async*` and
/// the stream `u` associated with `m` has been canceled, then the `yield`
/// statement returns without an object. Test the case when there is no
/// `finally` handler defined.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

bool generatorAlive = false;

Stream<int> generator() async* {
  int i = 0;
  while (true) {
    generatorAlive = true;
    yield i++;
  }
}

test() async {
  generatorAlive = false;
  Stream<int> s = generator();
  late StreamSubscription<int> ss;
  ss = s.listen((int x) async {
    if (!generatorAlive) {
      Expect.fail("The generator function is unexpectedly not alive");
    }
    if (x == 5) {
      //  Allow the generator to work for some time.
      Expect.isTrue(generatorAlive);
      await ss.cancel();
      generatorAlive = false;
      // verify that generator is not active
      for (int i = 0; i < 10; i++) {
        Expect.isFalse(generatorAlive);
        await new Future.delayed(new Duration(milliseconds: 10));
      }
      asyncEnd();
    }
  });
}

main() {
  asyncStart();
  test();
}
