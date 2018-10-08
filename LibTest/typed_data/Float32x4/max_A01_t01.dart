/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 max(Float32x4 other)
 * Returns the lane-wise maximum value in [this] or [other].
 * @description Checks that the returned value contains maximums of
 * corresponding lane values from [this] and [other].
 * @author msyabro
 */

import "dart:typed_data";
import "dart:math";
import "../../../Utils/expect.dart";

check(Float32x4 val1, Float32x4 val2) {
  var res = val1.max(val2);
  Expect.equals(max(val1.x, val2.x), res.x);
  Expect.equals(max(val1.y, val2.y), res.y);
  Expect.equals(max(val1.z, val2.z), res.z);
  Expect.equals(max(val1.w, val2.w), res.w);
}

main() {
  check(new Float32x4(.0, .0, .0, .0), new Float32x4(.0, .0, .0, .0));
  check(new Float32x4(-1.0, -1.0, -1.0, -1.0),
      new Float32x4(1.0, 1.0, 1.0, 1.0));
  check(new Float32x4(1e-1, 0.23e12, -1.04e3, 0.48e-9),
      new Float32x4(1e-2, 022e12, -1.04e4, 0.4e-9));
}
