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

extension on double? {
  double? operator /(double? other) {
    if (this != null && other != null) {
      return this! / other;
    }
    return null;
  }
}

main() {
  double? x = 2 > 1 ? 1.0 : null;

  var list = [
    ?x /= 1,
    ?x /= null
  ];
  Expect.listEquals([1], list);

  x = 2 > 1 ? 1.0 : null;
  var set = {
    ?x /= 1,
    ?x /= null
  };
  Expect.setEquals({1}, set);

  x = 2 > 1 ? 1.0 : null;
  var map1 = {
    ?x /= 1: 1,
    2: ?x /= 1,
    ?x /= null: 3,
    4: ?x /= null
  };
  Expect.mapEquals({1: 1, 2: 1}, map1);

  x = 2 > 1 ? 1.0 : null;
  var map2 = {
    ?x /= 1: ?x /= 1,
    ?x /= null: ?x /= null
  };
  Expect.mapEquals({1: 1}, map2);
}
