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

String test1(int num) {
  int i = 0;
  return switch (num) {
    < i => "negative",
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    == i => "zero",
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    > i => "positive",
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "Impossible!"
  };
}

String test2(int num) {
  final j = 0;
  return switch (num) {
    != j => "non-zero",
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    == j => "zero",
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "Impossible!"
  };
}

main() {
  test1(1);
  test2(2);
}
