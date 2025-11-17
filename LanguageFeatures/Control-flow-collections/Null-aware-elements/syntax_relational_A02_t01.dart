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
/// @description Check that it is not a syntax error to use a relational
/// expression in the form `is`, `is!` as an expression in a
/// `nullAwareMapElement` or `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

main() {
  var list = [
    ?1 is String,
//  ^
// [analyzer] unspecified
    ?2 is! String
//  ^
// [analyzer] unspecified
  ];
  Expect.listEquals([false, true], list);

  var set = {
    ?1 is String,
//  ^
// [analyzer] unspecified
    ?2 is! String
//  ^
// [analyzer] unspecified
  };
  Expect.setEquals({false, true}, set);

  var map1 = {
    ?1 is String: 1,
//  ^
// [analyzer] unspecified
    ?2 is! String: 2,
//  ^
// [analyzer] unspecified
    3: ?3 is String,
//     ^
// [analyzer] unspecified
    4: ?4 is! String
//     ^
// [analyzer] unspecified
  };
  Expect.mapEquals({false: 1, true: 2, 3: false, 4: true}, map1);

  var map2 = {
    ?1 is String: ?1 is String,
//  ^
// [analyzer] unspecified
    ?2 is! String: ?2 is! String,
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({false: false, true: true}, map2);
}
