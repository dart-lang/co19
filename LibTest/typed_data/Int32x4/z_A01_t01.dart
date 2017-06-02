/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int z
 * Extracts 32-bit mask from z lane.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(z) {
  var obj = new Int32x4(0, 0, z, 0);
  Expect.equals(z, obj.z);
}

main() {
  check(0);
  check(1);
  check(-1);
  check(256);
  check(2147483647);
  check(-2147483647);
}
