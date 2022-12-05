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
/// is not a valid constant expression. Test switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(int num) {
  int i = 0;
  return switch (num) {
    case < i => "negative";
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    case == i => "zero";
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    case > i => "positive";
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    default => "Impossible!";
  };
}

String test2(int num) {
  final j = 0;
  return switch (num) {
    case != j => "non-zero";
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    case == j => "zero";
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    default => "Impossible!";
  };
}

main() {
  test1(1);
  test2(2);
}
