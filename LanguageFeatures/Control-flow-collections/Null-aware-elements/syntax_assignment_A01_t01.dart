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
/// @description Check that an expression in a `nullAwareMapElement` and a
/// `nullAwareExpressionElement` can be in a form
/// `⟨assignableExpression⟩ ⟨assignmentOperator⟩ ⟨expression⟩`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

main() {
  int? e1 = 2 > 1 ? 1 : null; // 1
  int? e2 = 2 > 1 ? null : 1; // null
  int? x;

  var list = [
    ?x = e1,
    ?x = e2
  ];
  Expect.listEquals([e1], list);

  var set = {
    ?x = e1,
    ?x = e2
  };
  Expect.setEquals({e1}, set);

  var map = {
    ?x = e1: 1,
    ?x = e2: 2,
    3: ?x = e1,
    4: ?x = e2,
    ?x = e1: ?x = e1,
    ?x = e2: ?x = e2
  };
  Expect.mapEquals({e1: 1, 3: e1, e1: e1}, map);
}
