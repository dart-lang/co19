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
/// @description Check that an unary postfix expression in the form `e++` and
/// `e--` can be used as an expression in a `nullAwareMapElement` or
/// `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

extension on int? {
  int? operator +(int? other) {
    if (other != null && this != null) {
      return this! + other;
    }
    return null;
  }
  int? operator -(int? other) {
    if (other != null && this != null) {
      return this! - other;
    }
    return null;
  }
}

main() {
  int? e1 = 2 > 1 ? 1 : null; // 1
  int? e2 = 1 > 2 ? 1 : null; // null

  var list = [
    ?e1++,
    ?e2++,
    ?e1--,
    ?e2--
  ];
  Expect.listEquals([1, 2], list);

  var set = {
    ?e1++,
    ?e2++,
    ?e1--,
    ?e2--
  };
  Expect.setEquals({1, 2}, set);

  var map1 = {
    ?e1++: 1,
    ?e2++: 2,
    ?e1--: 3,
    ?e2--: 4,
    5: ?e1++,
    6: ?e2++,
    7: ?e1--,
    8: ?e2--
  };
  Expect.mapEquals({1: 1, 2: 3, 5: 1, 7: 2}, map1);

  var map2 = {
    ?e1++: ?e1++,
    ?e2++: ?e2++,
    ?e1--: ?e1--,
    ?e2--: ?e2--
  };
  Expect.mapEquals({1: 2, 3: 2}, map2);
}
