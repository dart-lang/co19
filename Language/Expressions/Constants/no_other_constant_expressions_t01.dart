// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion There are no other constant expressions.
///
/// @description Checks that a null-check operator cannot be used in a constant
/// expression.
/// @author sgrekhov22@gmail.com
/// @issue 59800

const one = 1!;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

const int? two = 2;
const int nonNullableTwo = two!;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
const int three = 1 + two!;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(one);
  print(two);
  print(nonNullableTwo);
  print(three);
}
