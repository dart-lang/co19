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
/// @description Check that it is not an error if `nullAwareExpressionElement`
/// and `nullAwareMapElement` contain if-null expression
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

int? f(int? v) => v;

main() {
  var list = [
    ? f(1) ?? null,
    ? f(null) ?? 2, // ignore: invalid_null_aware_operator
    ? f(null) ?? null
  ];
  Expect.listEquals([1, 2], list);

  var set = {
    ? f(1) ?? null,
    ? f(null) ?? 2, // ignore: invalid_null_aware_operator
    ? f(null) ?? null
  };
  Expect.setEquals({1, 2}, set);

  var map = {
    // ?1: 0
    ? f(1) ?? null: f(0) ?? null,
    // ?2: 0
    ? f(null) ?? 2: f(0) ?? null,  // ignore: invalid_null_aware_operator
    // ?3: null
    ? f(null) ?? 3: f(null) ?? null,  // ignore: invalid_null_aware_operator
    // ?null: 0
    ? f(null) ?? null: f(0) ?? null,

    // 4: ?null
    f(4) ?? null: ? f(null) ?? null,
    // 5: ?5
    f(5) ?? null: ? f(5) ?? null,
    // 6: ?6
    f(null) ?? 6: ? f(null) ?? 6,  // ignore: invalid_null_aware_operator
    // null: ?7
    f(null) ?? null: ? f(null) ?? 7, // ignore: invalid_null_aware_operator

    // ?8: ?null
    ?f(8) ?? null: ?f(null) ?? null,
    // ?9: ?9
    ?f(9) ?? null: ?f(9) ?? null,
    // ?null: ?10
    ?f(null) ?? 10: ?f(null) ?? 10, // ignore: invalid_null_aware_operator
    // ?null: ?null
    ?f(null) ?? null: ?f(null) ?? 11, // ignore: invalid_null_aware_operator
  };
  Expect.mapEquals(
      {1: 0, 2: 0, 3: null, 5: 5, 6: 6, null: 7, 9: 9, 10: 10}, map);
}
