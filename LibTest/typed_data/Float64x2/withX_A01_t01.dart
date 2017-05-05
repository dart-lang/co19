/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 withX(double x)
 * Returns a new Float64x2 copied from this with a new x value.
 * @description Checks that the returned Float64x2 contains y value from this
 * and new x value.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1, s) {
  var obj = new Float64x2(x1, y1);
  var res = obj.withX(s);
  Expect.equals(s, res.x);
  Expect.equals(y1, res.y);
}

main() {
  check(.0, .0, 5.0);
  check(-5.0, .0, 6.0);
  check(1.0, 1.0, 3.14);
  check(-5.0, 1.0001, 2.23);
  check(10.0, -.05, 4.0);
  check(0.23e-40, -0.0, 11.0);
}
