/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 scale(double s)
 * Returns a copy of this each lane being scaled by s. Equivalent to
 * this * new Float32x4.splat(s).
 *
 * Returns a copy of [this] each lane being scaled by [s].
 * @description Checks that the returned value contains corresponding lanes
 * of [this] scaled by [s].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, s) {
  var obj = new Float32x4(x,y,z,w);
  var res = obj.scale(s);
  Expect.approxEquals(obj.x * s, res.x, (res.x / 1e7).abs());
  Expect.approxEquals(obj.y * s, res.y, (res.y / 1e7).abs());
  Expect.approxEquals(obj.z * s, res.z, (res.z / 1e7).abs());
  Expect.approxEquals(obj.w * s, res.w, (res.w / 1e7).abs());
}

main() {
  check(1.0, 1.0, 1.0, 1.0, .0);
  check(1.0, 1.0, 1.0, 1.0, 1.0);
  check(2.0, 2.0, 2.0, 2.0, .5);
  check(0.5, 0.2, 10.5, 0.13, 1.12e-3);
  check(1e-10, 2.43e-14, 0.23e3, 9.31e18, 0.97e3);
}
