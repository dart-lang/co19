/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num operator *(num other)
 * This operator implements the arithmetic multiply operation.
 * @description Checks that this operator returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1, 1 * 1);
  Expect.equals(0, 1 * 0);

  Expect.equals(4294967296, 2147483648 * 2);
  Expect.equals(18446744073709551616, 4294967296 * 4294967296);

  Expect.equals(79228162514264337593543950336, 281474976710656 * 281474976710656);
  // 2e63 - 1
  Expect.equals(9223372036854775807000000000000000000000000000000,
      9223372036854775807 * 1000000000000000000000000000000);
  // -2e63
  Expect.equals(-9223372036854775808000000000000000000000000000000, -9223372036854775808 * 1000000000000000000000000000000);

  // 2e64
  Expect.equals(18446744073709551616000000000000000000000000000000,
      18446744073709551616 * 1000000000000000000000000000000);
  Expect.equals(340282366920938463463374607431768211456,
      18446744073709551616 * 18446744073709551616);
  Expect.equals(-340282366920938463463374607431768211456,
      18446744073709551616 * (-18446744073709551616));
}

