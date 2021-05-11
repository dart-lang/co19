// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is definitely unassigned unless the variable is non-final, and
/// non-late, and has nullable type.
///
/// @description Checks that it's a compile time error to read a local late
/// variable when the variable is definitely unassigned
/// @author sgrekhov@unipro.ru


main() {
  late int x1;
  x1 *= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late double x2;
  x2 /= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x3;
  x3 ~/= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x4;
  x4 %= 22;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x5;
  x5 += 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x6;
  x6 -= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x7;
  x7 <<= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x8;
  x8 >>= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x9;
  x9 &= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x10;
  x10 ^= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x11;
  x11 |= 2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late int x12;
  x12 ??= 2;
//^^^
// [analyzer] COMPILE_TIME_ERROR.DEFINITELY_UNASSIGNED_LATE_LOCAL_VARIABLE
//        ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
// [cfe] unspecified
}
