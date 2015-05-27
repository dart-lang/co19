/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This operator implements a bit-wise XOR operation.
 * @description Checks that this operator returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
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
  Expect.equals(0, 0xABC235D235EFE23678FDBCA ^ 0xABC235D235EFE23678FDBCA);
  // x ^ 0 = x
  Expect.equals(0xABC235D235EFE23678FDBCA, 0xABC235D235EFE23678FDBCA ^ 0);
  Expect.equals(0xABC235D235EFE23678FDBCA, 0 ^ 0xABC235D235EFE23678FDBCA);

  // (2^70) ^ (2^70 - 1) = 2^71 - 1
  Expect.equals(0x7FFFFFFFFFFFFFFFFF, 0x400000000000000000 ^ 0x3FFFFFFFFFFFFFFFFF);
  
  Expect.equals(-2, 1 ^ (-1));
  Expect.equals(-0x10000000000000001, (-1) ^ 0x010000000000000000); // 1 << 64
  // TODO: add more checks when it's clear how larger integers are represented in binary
  //Expect.equals(0x7fffffffffffffffff, (-1) ^ 0x800000000000000000); // 1 << 71
}

