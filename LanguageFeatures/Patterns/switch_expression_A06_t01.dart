// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ```
/// primary                 ::= // Existing productions...
///                           | switchExpression
///
/// switchExpression      ::= 'switch' '(' expression ')' '{'
///                           switchExpressionCase ( ',' switchExpressionCase )*
///                           ','? '}'
/// switchExpressionCase  ::= guardedPattern '=>' expression
/// ```
/// @description Check that binary operator expressions derived from
/// `bitwiseOrExpression` are not valid in a `guardedPattern` and produce a
/// compile-time error.
/// @author sgrekhov22@gmail.com

void test(Object value) {
  var x = switch (value) {
    1 + 2 => 1,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    2 - 1 => 2,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    2 * 2 => 3,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    2 / 2 => 4,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    30 ^ 2 => 5,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    1 | 4 => 6,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    1 & 4 => 7,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    15 % 8 => 8,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    19 ~/ 8 => 9,
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
    19 >> 1 => 10,
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
    87 >>> 1 => 11,
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
    19 << 1 => 12,
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
    -1 > 2 => 13,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    -1 < 2 => 14,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    1 >= 2 => 15,    // ignore: unreachable_switch_case
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
    -1 <= 2 => 16,   // ignore: unreachable_switch_case
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
    1 == -2 => 17,  // ignore: unreachable_switch_case
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
    1 != 2 => 18,    // ignore: unreachable_switch_case
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
    "Lily" + " " "was" " " + "here"  => 19,
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => 0
  };
}

main() {
  print(test);
}
