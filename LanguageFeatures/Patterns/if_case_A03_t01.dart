// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We replace the existing ifStatement rule with:
/// ```
/// ifStatement ::= ifCondition statement ('else' statement)?
/// ifCondition :== 'if' '(' expression ( 'case' guardedPattern )? ')'
/// ```
/// @description Checks that pure `bitwiseOrExpression` constant expressions are
/// not valid in a `guardedPattern` and produce a compile-time error.
/// @author sgrekhov22@gmail.com

void test(Object value) {
  if (value case 1 + 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 - 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 * 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 / 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 ^ 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 | 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 & 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 % 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 ~/ 2) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 >> 2) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 >>> 2) {}
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 << 2) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 > 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 < 2) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 >= 2) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 <= 2) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 == 2) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case 1 != 2) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case '1' + '2') {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
