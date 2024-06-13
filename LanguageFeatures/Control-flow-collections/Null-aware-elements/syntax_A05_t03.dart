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
/// and `nullAwareMapElement` contain null-aware property extraction expression
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

int? f(int? v) => v;

main() {
  var list = [
    ? f(1)?.abs(),
    ? f(null)?.abs()
  ];
  Expect.listEquals([1], list);

  var set = {
    ? f(1)?.abs(),
    ? f(null)?.abs()
  };
  Expect.setEquals({1}, set);

  var map = {
    ? f(1)?.abs() : f(1)?.abs(), // ?1: 1
    ? f(null)?.abs(): f(0)?.abs(), // ?null: 0
    f(2)?.abs() : ?f(2)?.abs(),  // 2: ?2
    f(3)?.abs(): ?f(null)?.abs(), // 3: ?null
    ?f(4)?.abs() : ?f(4)?.abs(), // ?4: ?4
    ?f(null)?.abs(): ?f(5)?.abs(), // ?null: ?5
    ?f(6)?.abs() : ?f(null)?.abs(), // ?6: ?null
    ?f(null)?.abs(): ?f(null)?.abs() // ?null: ?null
  };
  Expect.mapEquals({1: 1, 2: 2, 4: 4}, map);
}
