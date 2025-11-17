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
/// and `nullAwareMapElement` contain conditional expression
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

bool f(bool v) => v;

main() {
  var list = [
    ? f(true) ? 1 : null,
    ? f(true) ? null : 2
  ];
  Expect.listEquals([1], list);

  var set = {
    ? f(true) ? 1 : null,
    ? f(true) ? null : 2
  };
  Expect.setEquals({1}, set);

  var map = {
    ?f(true) ? 1 : null : f(true) ? null : 0, // ?1 : null
    ?f(false) ? 0 : null : f(false) ? null : 2, // ?null : 2
    f(true) ? 3 : null : ?f(true) ? null : 0, // 3 : ?null
    f(true) ? 4 : null : ?f(false) ? null : 5, // 4 : ?5
    f(false) ? 0 : null : ?f(false) ? null : 6, // null : ?6
    ?f(false) ? 0 : null : ?f(true) ? null : 0, // ?null : ?null
    ?f(true) ? 0 : null : ?f(true) ? null : 0, // ?0 : ?null
    ?f(false) ? 0 : null : ?f(false) ? null : 0, // ?null : ?0
    ?f(true) ? 7 : null : ?f(false) ? null : 8, // ?7 : ?8
  };
  Expect.mapEquals({1: null, 4: 5, null: 6, 7: 8}, map);
}
