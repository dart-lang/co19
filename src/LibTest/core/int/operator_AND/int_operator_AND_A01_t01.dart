/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This operator implements a bit-wise AND operation.
 * @description Checks that this operator returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

main() {
  Expect.equals(0, 0 & 0);
  Expect.equals(0, 0 & 1);
  Expect.equals(0, 1 & 0);
  Expect.equals(1, 1 & 1);

  Expect.equals(1, 25 & 3);
  Expect.equals(9, 15 & 9);

  // x & x = x
  Expect.equals(0x100000000, 0x100000000 & 0x100000000);
  Expect.equals(0x10000000000000001, 0x10000000000000001 & 0x10000000000000001);

  Expect.equals(0, 0x100000000 & 0x80000000);
  Expect.equals(0x10000000000000000, 0x10000000000000001 & 0x10000000000000000);
  Expect.equals(0, 0x400000000000000000 & 0x3FFFFFFFFFFFFFFFFF);

  // negative arguments
  Expect.equals(1, -1 & 1);
  Expect.equals(1, 1 & -1);
  Expect.equals(-1, -1 & -1);
  Expect.equals(-3, -3 & -3);
  Expect.equals(1, -3 & 3);
  Expect.equals(0, -3 & 2);
  Expect.equals(-100, -100 & -1);
  Expect.equals(-100, -1 & -100);
  
  // assuming a large int is represented using minimum number of bytes required and the leftmost bit stands for the sign
  int bignum = 0x265ABCF6285BC6235DCBA78638653786378;
  Expect.equals(bignum, bignum & bignum);
  Expect.equals(0, bignum & (-1 - bignum));// -1 - x = ~x for x >= 0
}
