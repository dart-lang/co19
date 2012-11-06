/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num operator -(num other)
 * This operator implements arithmetic substraction operation.
 * @description Checks that this operator returns correct value for both integer 
 * and double arguments (including special values).
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

import "dart:math" as Math;

main() {
  Expect.equals(0, 1 - 1);
  Expect.equals(2147483646, 2147483647 - 1);
  Expect.equals(-2147483649, -2147483648 - 1);
  Expect.equals(4294967294, 4294967295 - 1);
  Expect.equals(-4294967297, -4294967296 - 1);
  Expect.equals(9223372036854775806, 9223372036854775807 - 1);
  Expect.equals(-9223372036854775809, -9223372036854775808 - 1);
  Expect.equals(-18446744073709551617, -9223372036854775808 - 9223372036854775809);
  Expect.equals(18446744073709551617, 9223372036854775808 - -9223372036854775809);
  Expect.equals(-10000000000000000000000000, 18446744073709551616 - 10000018446744073709551616);

  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  Expect.equals(0.0, 0 - 0.0);
  Expect.equals(0.0, 0 - -0.0);
  Expect.equals(0.0, 1 - 1.0);
  Expect.equals(0.0, -1 - -1.0);

  Expect.equals(double.NEGATIVE_INFINITY, 0 - double.INFINITY);
  Expect.equals(double.INFINITY, 0 - double.NEGATIVE_INFINITY);
  Expect.equals(NEG_MIN_DOUBLE, 0 - MIN_DOUBLE);
  Expect.equals(NEG_MAX_DOUBLE, 0 - MAX_DOUBLE);

  Expect.isTrue((0 - double.NAN).isNaN);
}
