/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 withZWInXY(Float32x4 other)
 * Returns a new Float32x4 with values in the X and Y
 * lanes replaced with the values in the Z and W lanes of other.
 * @description
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1, z1, w1, x2, y2, z2, w2) {
  var obj = new Float32x4(x1, y1, z1, w1);
  var other = new Float32x4(x2, y2, z2, w2);
  var res = obj.withZWInXY(other);

  Expect.approxEquals(other.z, res.x, (z2/1e7).abs());
  Expect.approxEquals(other.w, res.y, (w2/1e7).abs());
  Expect.approxEquals(obj.z, res.z, (z1/1e7).abs());
  Expect.approxEquals(obj.w, res.w, (w1/1e7).abs());
}

main() {
  check(0.0, 0.0, 0.0, 0.0,       2.0, 3.0, 2.0, 2.0);
  check(1e-1, 1e-1, 1e-1, 1e-1,   1e-1, 1e-1, 1e-1, 1e-1);
  check(0.12e-5, 1.2e12, 1e38, 4.332e-1, 4.34e14, 0.009e-1, 2.33, 8.098e-20);
}