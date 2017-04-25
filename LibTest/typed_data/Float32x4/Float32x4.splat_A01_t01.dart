/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4.splat(double v)
 * @description Checks that an instance of [Float32x4] is created and all fields
 * are set correctly.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(v) {
  var obj = new Float32x4.splat(v);
  Expect.isTrue(obj is Float32x4);
  Expect.approxEquals(v, obj.x, (v / 1e7).abs());
  Expect.approxEquals(v, obj.y, (v / 1e7).abs());
  Expect.approxEquals(v, obj.z, (v / 1e7).abs());
  Expect.approxEquals(v, obj.w, (v / 1e7).abs());
}

main() {
  check(0.0);
  check(-0.0);
  check(2e-2);
  check(3.40282e+038);
  check(0.12e-20);
  check(10e10);
}
