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
/// @description Check that it is not a syntax error to use a `throwExpression`
/// as an expression in a `nullAwareMapElement` and a
/// `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

main() {
  if (1 > 2) {
    <Never>[
      ?throw "Never"
//    ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ];
  }
  if (1 > 2) {
    <Never>{
      ?throw "Never"
//    ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    };
  }
  if (1 > 2) {
    <Never, int>{
      ?throw "key": 1
//    ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    };
  }
  if (1 > 2) {
    <int, Never>{
      1: ?throw "value"
//       ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    };
  }
  if (1 > 2) {
    <Never, Never>{
      ?throw "key": ?throw "value"
//    ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    };
  }
}
