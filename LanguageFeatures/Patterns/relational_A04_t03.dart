// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion relationalPattern ::=
///   ( equalityOperator | relationalOperator) relationalExpression
///
/// A relational pattern lets you compare the matched value to a given constant
/// using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
/// The pattern matches when calling the appropriate operator on the matched
/// value with the constant as an argument returns true. It is a compile-time
/// error if relationalExpression is not a valid constant expression.
///
/// @description Check that it is a compile-time error if relationalExpression
/// is not a valid constant expression. Test an if-case statement
/// @author sgrekhov22@gmail.com

main() {
  int i = 0;
  int value = 42;

  if (value case < i) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case == 0 + i) {}
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case > i++) {}
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final j = 0;
  if (value case != j) {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case == j) {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}
