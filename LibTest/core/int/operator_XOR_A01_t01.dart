/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator ^(int other)
 * This operator implements a bit-wise XOR operation.
 * @description Checks that this operator returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0 ^ 0);
  Expect.equals(1, 0 ^ 1);
  Expect.equals(1, 1 ^ 0);
  Expect.equals(0, 1 ^ 1);

  Expect.equals(0, 3 ^ 3);
  Expect.equals(1, 3 ^ 2);
  Expect.equals(3, 1 ^ 2);
  Expect.equals(3, 0 ^ 3);

  Expect.equals(0x1A, 0x19 ^ 0x03);
  Expect.equals(0x06, 0x0F ^ 0x09);
  
  // x ^ y ^ y = x
  Expect.equals(0x19, 0x19 ^ (0x03 ^ 0x03));
  Expect.equals(0x19, (0x19 ^ 0x03) ^ 0x03);
  Expect.equals(0x03, 0x19 ^ (0x03 ^ 0x19));
  Expect.equals(0x03, (0x19 ^ 0x03) ^ 0x19);
  
  // x ^ x = 0
  Expect.equals(0, 0xABC235D235EFE23 ^ 0xABC235D235EFE23);
  // x ^ 0 = x
  Expect.equals(0xABC235D235EFE23, 0xABC235D235EFE23 ^ 0);
  Expect.equals(0xABC235D235EFE23, 0 ^ 0xABC235D235EFE23);

  Expect.equals(0x7FFFFFFFFFFFFFFF, 0x4000000000000000 ^ 0x3FFFFFFFFFFFFFFF);
  
  Expect.equals(-2, 1 ^ (-1));
  Expect.equals(-0x1000000000000001, (-1) ^ 0x01000000000000000); // 1 << 64
}

