// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @issue 54627

// SharedOptions=--enable-experiment=inline-class

extension type const NumET(num _) implements num {}

String test(List<num> list) {
  NumET i = NumET(0);
  return switch (list) {
    [> i && <= 2] => "case 1",
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    [== -NumET(0)] => "case 2",
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [>= NumET(0) && < 20] => "case 3",
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [!= NumET(0) + 1] => "case 4",
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

main() {
  final i = NumET(0);

  List<num> list = [];

  switch (list) {
    case [> i && <= 2]:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case [== -NumET(0)]:
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case [>= NumET(0) && < 20]:
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case [!= NumET(0) + 1]:
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    default:
  }
  if (list case [> i && <= 2]) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  if (list case [== NumET(0)]) {}
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (list case [>= NumET(0) && < 20]) {}
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (list case [!= -NumET(0)]) {}
//                   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  test(list);
}
