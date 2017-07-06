/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int signMask
 * Extract the sign bits from each lane return them in the first 4 bits.
 * "x" lane is bit 0. "y" lane is bit 1. "z" lane is bit 2. "w" lane is bit 3.
 * @description Checks that the correct value is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var fl32x4 = new Float32x4(-1.0, 2.0, 3.0, 4.0);
  int sm = fl32x4.signMask;
  Expect.equals(0x00000001, sm);

  fl32x4 = new Float32x4(1.0, -2.0, 3.0, 4.0);
  sm = fl32x4.signMask;
  Expect.equals(0x00000002, sm);

  fl32x4 = new Float32x4(1.0, 2.0, -3.0, 4.0);
  sm = fl32x4.signMask;
  Expect.equals(0x00000004, sm);

  fl32x4 = new Float32x4(1.0, 2.0, 3.0, -4.0);
  sm = fl32x4.signMask;
  Expect.equals(0x00000008, sm);

  fl32x4 = new Float32x4(-1.0, -2.0, -3.0, -4.0);
  sm = fl32x4.signMask;
  Expect.equals(0x0000000F, sm);
}
