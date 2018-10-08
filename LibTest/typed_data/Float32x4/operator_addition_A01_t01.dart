/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 operator +(Float32x4 other)
 * Addition operator.
 * @description Checks that every lane of the new [Float32x4] equals the
 * sum of corresponding lanes of operands.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1, z1, w1, x2, y2, z2, w2) {
  var op1 = new Float32x4(x1, y1, z1, w1);
  var op2 = new Float32x4(x2, y2, z2, w2);
  var res = op1 + op2;
  Expect.approxEquals(x1 + x2, res.x, (res.x / 1e7).abs());
  Expect.approxEquals(y1 + y2, res.y, (res.y / 1e7).abs());
  Expect.approxEquals(z1 + z2, res.z, (res.z / 1e7).abs());
  Expect.approxEquals(w1 + w2, res.w, (res.w / 1e7).abs());
}

main() {
  check(.0, .1, .2, .1, .2, .1, .0, .5);
  check(1.23e20, 3.94e30, 0.23e21, -2.3e23,
      -1.324e18, 0.234e32, -0.9e31, 12.32e19);
  check(1e-30, 0.23e-23, -1.24e-29, 0.234e-22,
      12.345e-60, 0.834e-20, 2.946e-28, 0.217e-22);
  check(32.81e30, 1.907e28, 0.41e31, 9.9e27,
      -1.92e-20, -0.24e-10, 54.231e-35, 932.314e-21);
}
