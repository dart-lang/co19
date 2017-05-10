/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 operator *(Float64x2 other)
 * Multiplication operator.
 * @description Checks that every lane of the new [Float64x2] equals the
 * product of corresponding lanes of operands.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1, x2, y2) {
  var op1 = new Float64x2(x1, y1);
  var op2 = new Float64x2(x2, y2);
  var res = op1 * op2;
  Expect.equals(x1 * x2, res.x);
  Expect.equals(y1 * y2, res.y);
}

main() {
  check(.0, .1, .2, .1);
  check(1.23e18, 3.94e20, -1.324e18, 0.234e16);
  check(1e-15, 0.23e-20, 12.345e-21, 0.834e-16);
  check(32.81e30, 1.907e28, -1.92e-20, -0.24e-10);
}
