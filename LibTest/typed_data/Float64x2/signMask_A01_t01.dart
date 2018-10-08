/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int signMask
 * Extract the sign bits from each lane return them in the first 2 bits. "x"
 * lane is bit 0. "y" lane is bit 1.
 * @description Checks that correct value is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  Float64x2 fl64x2 = new Float64x2(1.0, 2.0);
  int sm = fl64x2.signMask;
  Expect.equals(0x00000000, sm);

  fl64x2 = new Float64x2(-1.0, 2.0);
  sm = fl64x2.signMask;
  Expect.equals(0x00000001, sm);

  fl64x2 = new Float64x2(1.0, -2.0);
  sm = fl64x2.signMask;
  Expect.equals(0x00000002, sm);

  fl64x2 = new Float64x2(-1.0, -2.0);
  sm = fl64x2.signMask;
  Expect.equals(0x00000003, sm);
}
