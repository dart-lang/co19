// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | '-'? numericLiteral
///                   | stringLiteral
///                   | symbolLiteral
///                   | identifier
///                   | qualifiedName
///                   | constObjectExpression
///                   | 'const' typeArguments? '[' elements? ']'
///                   | 'const' typeArguments? '{' elements? '}'
///                   | 'const' '(' expression ')'
///
/// A constant pattern determines if the matched value is equal to the
/// constant's value. We don't allow all expressions here because many
/// expression forms syntactically overlap other kinds of patterns. We avoid
/// ambiguity while supporting terse forms of the most common constant
/// expressions like so:
/// ...
/// It is a compile-time error if a constant pattern's value is not a valid
/// constant expression.
///
/// @description Check that a syntax error is emitted for a term which could be
/// derived from <caseHead> in Dart 2.19, but cannot be derived from <caseHead>
/// when patterns are added to Dart. Test switch expression
/// @author sgrekhov22@gmail.com

int test() {
  Object value = Object();
  return switch (value) {
    1 + 2 => 1,
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 - 2 => 2,
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 * 2 => 3,
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 ^ 2 => 4,
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 % 2 => 5,
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 ~/ 2 => 6,
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 << 2 => 7,
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 >> 2 => 8,
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 >>> 2 => 9,
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 > 2 => 10,
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 >= 2:  => 11,
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 < 2: => 12,
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 <= 2 => 13,
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => -1
  };
}

main() {
  test();
}
