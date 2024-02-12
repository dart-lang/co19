// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion relationalPattern ::=
///   ( equalityOperator | relationalOperator) bitwiseOrExpression
///
/// A relational pattern lets you compare the matched value to a given constant
/// using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
/// The pattern matches when calling the appropriate operator on the matched
/// value with the constant as an argument returns true.
///
/// It is a compile-time error if bitwiseOrExpression is not a valid constant
/// expression.
///
/// @description Check that it is a compile-time error if `bitwiseOrExpression`
/// is not a valid constant expression. Test switch statement
/// @author sgrekhov22@gmail.com

main() {
  int i = 0;
  int value = 42;

  switch (value) {
    case < i:
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case == 0 + i:
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case > i++:
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
  }

  final j = 0;
  switch (value) {
    case != j:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case == j:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
  }
}
