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
/// @description Check that it is not a syntax error to use `new` and `const`
/// in an expression in a `nullAwareMapElement` and a
/// `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// TODO(sgrekhov): replace unspecified by the actual lint name

class C {
  final int id;
  const C(this.id);
}

main() {
  <Object>[
    ?new C(1),
//  ^
// [analyzer] unspecified
    ?const C(2)
//  ^
// [analyzer] unspecified
  ];
  <Object>{
    ?new C(1),
//  ^
// [analyzer] unspecified
    ?const C(2)
//  ^
// [analyzer] unspecified
  };
  <Object, Object>{
    ?new C(1): 1,
//  ^
// [analyzer] unspecified
    ?const C(2): 2,
//  ^
// [analyzer] unspecified
    3: ?new C(3),
//     ^
// [analyzer] unspecified
    4: ?const C(4),
//     ^
// [analyzer] unspecified
    ?new C(5): ?new C(5),
//  ^
// [analyzer] unspecified
    ?const C(6): ?const C(6)
//  ^
// [analyzer] unspecified
  };
}
