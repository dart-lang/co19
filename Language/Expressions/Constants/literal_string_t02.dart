// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A literal string where any interpolated expression is a compile-time
///   constant that evaluates to a numeric, string or boolean value or to null.
/// @description Checks that a string literal that involves string interpolation,
/// that is a constant expression not evaluated to numeric, string or boolean
/// value, cannot be assigned to a constant variable.
/// @author iefremov

const l = "${const {'k1': 1, 'k2': 2}}";
//         ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(l);
}
