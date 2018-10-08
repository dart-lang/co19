/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4(double x, double y, double z, double w)
 * Creates a new [Float32x4] instance.
 * @description Checks that an instance of [Float32x4] is created and all fields
 * are set correctly.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w) {
  var obj = new Float32x4(x, y, z, w);
  Expect.isTrue(obj is Float32x4);
  Expect.approxEquals(x, obj.x, (x / 1e7).abs());
  Expect.approxEquals(y, obj.y, (y / 1e7).abs());
  Expect.approxEquals(z, obj.z, (z / 1e7).abs());
  Expect.approxEquals(w, obj.w, (w / 1e7).abs());
}

main() {
  check(0.0, 0.0, 0.0, 0.0);
  check(2e-2, 2e-23, 1.38e12, 0.3e23);
  check(0.12e-20, 3.40282e+038,-1.3e-4, 34e34);
}
