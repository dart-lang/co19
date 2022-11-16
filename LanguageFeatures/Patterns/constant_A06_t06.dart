// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | numericLiteral
///                   | stringLiteral
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
/// @description Check that it is a compile-time error if a constant pattern's
/// value is not a valid constant expression. Test if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

const l = [1, 2, 3];

main() {
  Object value = Object();
  if (value case 2 / 1) {
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (value case true && true) {
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (value case false || true) {
//               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (value case l[0]) {
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
