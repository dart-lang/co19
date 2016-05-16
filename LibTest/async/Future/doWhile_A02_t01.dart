/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(dynamic f())
 * Perform an async operation repeatedly until it returns false.
 * . . .
 * The return values of all Futures are discarded. Any errors will cause the
 * iteration to stop and will be piped through the returned Future.
 *
 * @description Checks that any errors stop iteration, and error will be piped
 * through the returned Future.
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

const N = 4;

main() {

  int num = 0;

  bool ff() {
    if (num == 2) throw 5;
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
      Expect.fail("Should not be here");
      asyncEnd();
    })
   .catchError((e) {
      Expect.equals(2, num);
      Expect.equals(5, e);
      asyncEnd();
    });

}
