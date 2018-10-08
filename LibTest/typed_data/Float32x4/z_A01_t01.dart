/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double z
 * Extracted z value.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(z) {
  var obj = new Float32x4(0.0, 0.0, z, 0.0);
  Expect.approxEquals(z, obj.z, (z / 1e7).abs());
}

main() {
  check(0.0);
  check(1.0);
  check(3.40282e+038);
  check(1e-35);
  check(1.09e12);
  check(-0.12e-6);
}
