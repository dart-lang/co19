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
 * @description Checks that it is a compile-time error if the unbounded integer
 * value of a double valued integer literal with binary representation of 54 bit
 * length can not be represented exactly as an IEEE 754 double-precision value
 * (the most significant bit is 1 and the low bit is 1).
 * @author ngl@unipro.ru
 */

main() {
  double d1 = 0x20000000000001;
// [error line 20, column 0]
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d2 = 0x20000000000003;
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d3 = 0x20000000000005;
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d4 = 0x20000000000007;
// [error line 35, column 0]
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
}
