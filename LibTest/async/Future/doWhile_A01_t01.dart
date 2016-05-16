/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(dynamic f())
 * Perform an async operation repeatedly until it returns false.
 *
 * Runs f repeatedly, starting the next iteration only when the Future returned
 * by f completes to true. Returns a Future that completes once f returns false.
 *
 * @description Checks that doWhile runs f repeatedly, if f returns true, and
 * returns a Future that completes once f returns false.
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

const N = 3;

main() {
  int num = 0;

  bool ff() {
    if (num < N) {
      num++;
      return true;
    } else {
      return false;
    }
  }

  Future f = Future.doWhile(ff);

  asyncStart();
  f.then((fValue) {
    Expect.equals(N, num);
    asyncEnd();
  });

}

