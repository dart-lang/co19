/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(dynamic f())
 * Perform an async operation repeatedly until it returns false.
 * . . .
 * The function f may return either a bool or a Future that completes to a bool.
 *
 * @description Checks that f may return a Future that completes to a bool.
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

const N = 5;

main() {
  int num = 0;

  Future ff() {
    Completer c = new Completer();
    if (num < N) {
      num++;
      c.complete(true);
      return c.future;
    } else {
      c.complete(false);
      return c.future;
    }
  }

  Future f = Future.doWhile(ff);

  asyncStart();
  f.then((fValue) {
    Expect.equals(5, num);
    asyncEnd();
  })
  .catchError((e) {
    Expect.fail("Should not be here");
    asyncEnd();
  });

}

