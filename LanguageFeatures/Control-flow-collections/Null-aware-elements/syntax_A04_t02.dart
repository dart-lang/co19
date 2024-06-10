// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We add two new rules in the grammar and add two new clauses to
/// element:
///
/// element ::=
///   | nullAwareExpressionElement
///   | nullAwareMapElement
///   | // Existing productions...
///
/// nullAwareExpressionElement ::= '?' expression
///
/// nullAwareMapElement ::=
///   | '?' expression ':' '?'? expression // Null-aware key or both.
///   |     expression ':' '?' expression  // Null-aware value.
///
/// @description Check that it is a syntax error if a `nullAwareMapElement`
/// or a `nullAwareExpressionElement` is used in a string expression
/// @author sgrekhov22@gmail.com

main() {
  int? e = 2 > 1 ? 1 : null;

  <String>{
    "${ ?e }",
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    "${ 1: ?e }",
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    "${ ?e: 2 }"
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <String>[
    "${ ?e }",
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    "${ 1: ?e }",
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    "${ ?e: 2 }"
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  <String, int>{
    "${ ?e }": 1,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    "${ 1: ?e }": 2,
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    "${ ?e: 2 }": 3
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <int, String>{
    1: "${ ?e }",
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    2: "${ 1: ?e }",
//            ^
// [analyzer] unspecified
// [cfe] unspecified
    3: "${ ?e: 2 }"
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
