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
/// `nullAwareExpressionElement` can be in a form `e1 + e2`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

extension on int? {
  int? operator +(int? other) {
    if (this != null && other != null) {
      return this! + other;
    }
    return null;
  }

  int? operator -(int? other) {
    if (this != null && other != null) {
      return this! - other;
    }
    return null;
  }
}

main() {
  int? x = 2 > 1 ? 1 : null;

  var list = [
    ?x + 1,
    ?x - 1,
    ?x + null,
    ?x - null,
  ];
  Expect.listEquals([2, 0], list);

  var set = {
    ?x + 1,
    ?x - 1,
    ?x + null,
    ?x - null,
  };
  Expect.setEquals({2, 0}, set);

  var map1 = {
    ?x + 1: 1,
    ?x - 1: 2,
    ?x + null: 3,
    ?x - null: 4,
    5: ?x + 1,
    6: ?x - 1,
    7: ?x + null,
    8: ?x - null
  };
  Expect.mapEquals({2: 1, 0: 2, 5: 2, 6: 0}, map1);

  var map2 = {
    ?x + 1: ?x + 1,
    ?x - 1: ?x - 1,
    ?x + null: ?x + null,
    ?x - null: ?x - null,
  };
  Expect.mapEquals({2: 2, 0: 0}, map2);
}
