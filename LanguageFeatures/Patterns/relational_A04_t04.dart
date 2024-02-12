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
/// is not a valid constant expression. Test subexpression
/// @author sgrekhov22@gmail.com

String test(List<num> list) {
  int i = 0;
  final j = 10;
  return switch (list) {
    [> i && <= 2] => "case 1",
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    [== i++] => "case 2",
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
    [>= j && < 20] => "case 3",
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    [!= i--] => "case 4",
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

main() {
  int i = 0;
  final j = 10;

  List<num> list = [];

  switch (list) {
    case [> i && <= 2]:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case [== i++]:
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case [>= j && < 20]:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case [!= i--]:
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    default:
  }
  if (list case [> i && <= 2]) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (list case [== i++]) {}
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (list case [>= j && < 20]) {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  if (list case [!= i--]) {}
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  test(list);
}
