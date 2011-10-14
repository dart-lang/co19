/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Integers implement bit-operations (&, |, ^, ~, << and >>), 
 * and a truncating division operator ~/ .
 * @description Check bit-operations support on integers.
 * @author akuznecov
 * @reviewer msyabro
 */


main() {
  // and
  Expect.isTrue((3 & 3) == 3);
  Expect.isTrue((3 & 2) == 2);
  Expect.isTrue((1 & 2) == 0);
  Expect.isTrue((0 & 3) == 0);
  // check at size of int32
  Expect.isTrue((0x10000000 & 0xFFFFFFFF) == 0x10000000);
  // check at size of int64
  Expect.isTrue((0x1000000000000000 & 0xFFFFFFFF00000000) == 0x1000000000000000);
  // check at enourmous size of int512
  Expect.isTrue((0x8 << 512 & 0xF << 512) == 0x8 << 512);

  // or
  Expect.isTrue((3 | 3) == 3);
  Expect.isTrue((3 | 2) == 3);
  Expect.isTrue((1 | 2) == 3);
  Expect.isTrue((0 | 3) == 3);
  // check at size of int32
  Expect.isTrue((0x80000000 | 0x70000000) == 0xF0000000);
  // check at size of int64
  Expect.isTrue((0x8000000000000000 | 0x7000000000000000) == 0xF000000000000000);
  // check at enourmous size of int512
  Expect.isTrue((0x8 << 512 | 0x7 << 512) == 0xF << 512);

  // xor
  Expect.isTrue((3 ^ 3) == 0);
  Expect.isTrue((3 ^ 2) == 1);
  Expect.isTrue((1 ^ 2) == 3);
  Expect.isTrue((0 ^ 3) == 3);
  // check at size of int32
  Expect.isTrue((0x40000000 ^ 0x70000000) == 0x30000000);
  // check at size of int64
  Expect.isTrue((0x4000000000000000 ^ 0x7000000000000000) == 0x3000000000000000);
  // check at enourmous size of int512
  Expect.isTrue((0x4 << 512 ^ 0x7 << 512) == 0x3 << 512);

  // not
  Expect.isTrue(~0 == -1);
  Expect.isTrue(~3 == -4);
  Expect.isTrue(~~3 == 3);

  // shift
  Expect.isTrue((1 << 4) == 16);
  Expect.isTrue((0 << 4) == 0);
  Expect.isTrue((0x80 >> 4) == 0x8);
  Expect.isTrue((0x80 >> 8) == 0);
  Expect.isTrue((0 >> 4) == 0);
  Expect.isTrue((0 >> 4) == 0);
  Expect.isTrue((4 >> 0) == 4);
  Expect.isTrue((4 << 0) == 4);
  Expect.isTrue(((1 << 512) >> 512) == 1);
  Expect.isTrue(((1 >> 512) << 512) == 0);
  // add test for negative shift 2 << -1
  // negative test for integer overflow 1 << 9999999999

  // truncating division
  Expect.isTrue(10 ~/ 3 == 3);
  Expect.isTrue(1 ~/ 3 == 0);
  Expect.isTrue(-10 ~/ 3 == -3);
  Expect.isTrue(-1 ~/ 3 == 0);
  // add tests for division by zero 
}
