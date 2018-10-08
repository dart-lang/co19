/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 operator -()
 * Negate operator.
 * @description Checks that every lane of the new [Float32x4] equals the
 * negate value of the corresponding lane of [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1, z1, w1) {
  var op1 = new Float32x4(x1, y1, z1, w1);
  var res = -op1;
  Expect.approxEquals(-x1, res.x, (res.x / 1e7).abs());
  Expect.approxEquals(-y1, res.y, (res.y / 1e7).abs());
  Expect.approxEquals(-z1, res.z, (res.z / 1e7).abs());
  Expect.approxEquals(-w1, res.w, (res.w / 1e7).abs());
}

main() {
  check(.0, .1, .2, .1);
  check(1.23e20, 3.94e30, 0.23e21, -2.3e23);
  check(1e-30, 0.23e-23, -1.24e-29, 0.234e-23);
  check(-32.81e30, 1.907e28, -0.41e31, -9.9e27);
}
