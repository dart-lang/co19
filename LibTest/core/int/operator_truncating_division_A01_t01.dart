/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This operator implements truncating division.
 * @description Checks that this operator returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

void check(var expected, var actual) {
  Expect.equals(expected, actual);
  Expect.isTrue(actual is int);
} 
 
main() {
  check(1, 6 ~/ 4);
  check(-1, -6 ~/ 4);
  check(0, 1 ~/ 2);
  check(2, 31 ~/ 15);
  check(1, 32 ~/ 32);
  check(0, 0 ~/ 2147483647);
  check(-10, (-21) ~/ 2);

  check(9223372036854775808, 18446744073709551616 ~/ 2);
  check(-9223372036854775808, 18446744073709551616 ~/ -2);
  check(2, 18446744073709551616 ~/ 9223372036854775808);
  check(1249999988, 123456789012345678901234567890 ~/ 98765432109876543210);
}

