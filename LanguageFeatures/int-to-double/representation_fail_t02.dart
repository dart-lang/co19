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
/// IEEE 754 double-precision value.
/// @author ngl@unipro.ru


double d1 = 0x2fffffffffffff;
//          ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified

class C {
  static double d2 = 0x2fffffffffffff;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified

  double d3 = 0x2fffffffffffff;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
}

main() {
  double d4 = 0x2fffffffffffff;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified

  new C();
}
