/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Float32x4 zwxx
 * @description Checks that the correct value is returned.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w) {
  var obj = new Float32x4(x, y, z, w);
  var res = obj.zwxx;
  Expect.approxEquals(obj.z, res.x, (z/1e7).abs());
  Expect.approxEquals(obj.w, res.y, (w/1e7).abs());
  Expect.approxEquals(obj.x, res.z, (x/1e7).abs());
  Expect.approxEquals(obj.x, res.w, (x/1e7).abs());
}

main() {
  check(1.0, 1.0, 1.0, 0.0);
  check(1e-3, 0.23, 2.34e-12, 0.001e-20);
  check(1e30, 2.323e34, 0.23e10, 0.12e25);
  check(0.01, 0.22, 1.23, 12.5);
}
