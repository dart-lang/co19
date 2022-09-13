// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the unbounded integer value of a
/// double valued integer literal cannot be represented exactly as an IEEE 754
/// double-precision value, assuming that the mantissa is extended with zeros
/// until the precision is sufficiently high to unambiguously specify a single
/// integer value.
/// @description Checks that it is a compile-time error if the unbounded integer
/// value of a double valued integer literal cannot be represented exactly as an
/// IEEE 754 double-precision value. The unbounded integer 18446744073709551616
/// has the exact double value represented as 0x43F0000000000000, and the integer
/// 18446744073709551615 hasn't the exact double value representation.
/// @author ngl@unipro.ru


double d1 = 18446744073709551615;
//          ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INTEGER_LITERAL_IMPRECISE_AS_DOUBLE
// [cfe] The integer literal 18446744073709551615 can't be represented in 64 bits.

class C {
  static double d2 = 18446744073709551615;
//                   ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INTEGER_LITERAL_IMPRECISE_AS_DOUBLE
// [cfe] The integer literal 18446744073709551615 can't be represented in 64 bits.

  double d3 = 18446744073709551615;
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INTEGER_LITERAL_IMPRECISE_AS_DOUBLE
// [cfe] The integer literal 18446744073709551615 can't be represented in 64 bits.
}

main() {
  double d4 = 18446744073709551615;
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INTEGER_LITERAL_IMPRECISE_AS_DOUBLE
// [cfe] The integer literal 18446744073709551615 can't be represented in 64 bits.

  new C();
}
