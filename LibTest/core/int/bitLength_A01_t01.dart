/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int bitLength
 * Returns the minimum number of bits required to store this integer.
 * The number of bits excludes the sign bit, which gives the natural length for
 * non-negative (unsigned) values. Negative values are complemented to return
 * the bit position of the first bit that differs from the sign bit.
 * To find the number of bits needed to store the value as a signed value,
 * add one, i.e. use x.bitLength + 1.
 * @description Checks that this method returns the minimum number of bits
 * required to store this integer
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0.bitLength); // 00000000
  Expect.equals(1, 1.bitLength); // 00000001
  Expect.equals(2, 2.bitLength); // 00000010
  Expect.equals(2, 3.bitLength); // 00000011
  Expect.equals(3, 7.bitLength); // 00000111
  Expect.equals(4, 8.bitLength); // 00001000
  Expect.equals(5, 16.bitLength); // 00010000
  Expect.equals(8, 128.bitLength); // 10000000
  Expect.equals(8, 255.bitLength); // 11111111
  Expect.equals(9, 256.bitLength);
  Expect.equals(17, 65536.bitLength);
  Expect.equals(25, 16777216.bitLength);

  Expect.equals(0, (-1).bitLength); // 11111111
  Expect.equals(1, (-2).bitLength); // 11111110
  Expect.equals(2, (-3).bitLength); // 11111101
  Expect.equals(2, (-4).bitLength); // 11111100
}
