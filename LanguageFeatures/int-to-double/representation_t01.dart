/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the unbounded integer value of a
 * double valued integer literal cannot be represented exactly as an IEEE 754
 * double-precision value, assuming that the mantissa is extended with zeros
 * until the precision is sufficiently high to unambiguously specify a single
 * integer value.
 * @description Checks that it is no compile-time error if the unbounded integer
 * value of a double valued integer literal can be represented exactly as an
 * IEEE 754 double-precision value. The unbounded integer 18446744073709551616
 * has the exact double value represented as 0x43F0000000000000.
 * @author ngl@unipro.ru
 */

double d1 = 18446744073709551616;

class C {
  static double d2 = 18446744073709551616;

  double d3 = 18446744073709551616;
}

main() {
  double d4 = 18446744073709551616;

  new C();
}
