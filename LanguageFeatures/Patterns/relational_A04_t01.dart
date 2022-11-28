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
/// @description Check that it is a compile-time error if relational operator is
/// used with a wrong type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

const o = const Object();

String test(List<num> list) {
  return switch (list) {
    case [> "1" && <= 2] => "case 1";
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    case [== "42"] => "case 2";
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case [>= "10" && < 20] => "case 3";
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case [!= "100"] => "case 4";
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case [> 1 && <= true] => "case 5";
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case [>= 10 && < o] => "case 6";
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    default => "default";
  };
}

main() {
  test([]);

  int value = 42;
  switch (value) {
    case < "i":
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case == true:
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case > o:
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
  }

  switch (value) {
    case != "":
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case == true:
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
  }

  switch (value) {
    case >= "1":
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case <= "2":
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
  }
}
