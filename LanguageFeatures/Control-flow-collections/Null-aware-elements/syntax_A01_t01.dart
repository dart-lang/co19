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
/// @description Check that null-aware elements can't nest and contain other
/// elements
/// @author sgrekhov22@gmail.com

main() {
  List<int>? l = 2 > 1 ? [1, 2, 3] : null;
  [
    ?...l,
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    ?if (2 > 1) null
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  String? key = 2 > 1 ? "key" : null;
  <String?, int>{
    ??key: 1
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  int? v = 2 > 1 ? 1 : null;
  <String, int?>{
    "key": ??v
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
