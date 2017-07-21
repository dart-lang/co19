/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point<T> operator +(Point<T> other)
 * @description Checks that if at least one of coordinates is null,
 * an Exception is thrown.
 * @note undocumented
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(num x1, num y1, num x2, num y2) {
  Expect.throws(() {
    new Point(x1, y1) + new Point(x2, y2);
  });
}

main() {
  check(0, 1, -1, null);
  check(0, 1, null, -1);
  check(0, null, 1, -1);
  check(null, 0, 1, null);
  check(null, 0, null, -1);
  check(null, null, 1, -1);
  check(0, 1, null, null);
  check(0, null, 1, null);
  check(0, null, null, 1);
  check(0, null, null, null);
  check(null, 0, null, null);
  check(null, null, 0, null);
  check(null, null, null, 0);
  check(null, null, null, null);
}
