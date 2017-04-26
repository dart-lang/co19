/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 operator /(Float32x4 other)
 * Division operator.
 * @description Checks that every lane of the new [Float32x4] equals the result
 * of applying division operator to corresponding lanes of operands.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1, z1, w1, x2, y2, z2, w2, d) {
  var op1 = new Float32x4(x1, y1, z1, w1);
  var op2 = new Float32x4(x2, y2, z2, w2);
  var res = op1 / op2;
  Expect.approxEquals(x1 / x2, res.x, (res.x / d).abs());
  Expect.approxEquals(y1 / y2, res.y, (res.y / d).abs());
  Expect.approxEquals(z1 / z2, res.z, (res.z / d).abs());
  Expect.approxEquals(w1 / w2, res.w, (res.w / d).abs());
}

main() {
  check(.0, .1, .2, .1, .2, .1, .4, .5, 1e7);
  check(1.23e20, 3.94e30, 0.23e21, -2.3e23,
      -1.324e18, 0.234e32, -0.9e31, 12.32e19, 1e7);
  check(1e-20, 0.23e-23, -1.24e-20, 0.234e-20,
      12.345e-22, 0.834e-20, 2.946e-24, 0.217e-22, 1e1);
  check(32.81e30, 1.907e28, 0.41e31, 9.9e27,
      -1.92e-20, -0.24e-10, 54.231e-35, 932.314e-21, 1e7);
}
