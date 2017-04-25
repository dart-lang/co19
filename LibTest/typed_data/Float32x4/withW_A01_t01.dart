/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 withW(double w)
 * Returns a new Float32x4 copied from this with a new w value.
 * @description Checks that a new object is created and all its lanes except [w]
 * equal to corresponding lanes of [this]. Checks that [w] of new [Float32x4]
 * equals the [w] parameter of the method.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, newW) {
  var obj1 = new Float32x4(x, y, z, w);
  var obj2 = obj1.withW(newW);

  Expect.isFalse(obj1 == obj2);
  Expect.approxEquals(x, obj2.x, (x / 1e7).abs());
  Expect.approxEquals(y, obj2.y, (y / 1e7).abs());
  Expect.approxEquals(z, obj2.z, (z / 1e7).abs());
  Expect.approxEquals(newW, obj2.w, (newW / 1e7).abs());
}

main() {
  check(0.0, 0.0, 0.0, 0.0,       0.0);
  check(1e-1, 1e-1, 1e-1, 1e-1,   0.0);
  check(0.12e-5, 1.2e12, 1e38, 4.332e-1,  1.0);
}
