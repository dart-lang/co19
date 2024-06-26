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

// SharedOptions=--enable-experiment=null-aware-elements

main() {
  int? e = 2 > 1 ? 1 : null;
  List<int>? l = 2 > 1 ? [1, 2, 3] : null;

  [
    ?...l,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?if (2 > 1) null,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ??e,
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    ?for (var i = 0; i < 3; i++) e
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?for (var i in [1, 2, 3]) e
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  <Object?>{
    ?...l,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?if (2 > 1) null,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ??e,
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    ?for (var i = 0; i < 3; i++) e
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?for (var i in [1, 2, 3]) e
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  String? key = 2 > 1 ? "key" : null;
  List<Map<String, int>? m = 2 > 1 ? ? [{"k": 0}] : null;
  <String, int>{
    ?...m,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ??key: 1
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    ?for (var i = 0; i < 3; i++) "key:$i": e,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?for (var i in [4, 5, 6]) "key:$i": e,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?if (2 > 1) "key7": 0,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  int? v = 2 > 1 ? 1 : null;
  <String, int>{
    "key": ??v
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
