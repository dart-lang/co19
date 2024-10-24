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
/// @description Check that an unary prefix expression in the form `++e` and
/// `--e` can be used as an expression in a `nullAwareMapElement` or
/// `nullAwareExpressionElement`. Run-time test.
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
    ?++e1, // ignore: invalid_null_aware_operator
    ?++e2, // ignore: invalid_null_aware_operator
    ?--e1, // ignore: invalid_null_aware_operator
    ?--e2  // ignore: invalid_null_aware_operator
  ];
  Expect.listEquals([2, 1], list);

  var set = {
    ?++e1, // ignore: invalid_null_aware_operator
    ?++e2, // ignore: invalid_null_aware_operator
    ?--e1, // ignore: invalid_null_aware_operator
    ?--e2  // ignore: invalid_null_aware_operator
  };
  Expect.setEquals({2, 1}, set);

  var map1 = {
    ?++e1: 1, // ignore: invalid_null_aware_operator
    ?++e2: 2, // ignore: invalid_null_aware_operator
    ?--e1: 3, // ignore: invalid_null_aware_operator
    ?--e2: 4, // ignore: invalid_null_aware_operator
    5: ?++e1, // ignore: invalid_null_aware_operator
    6: ?++e2, // ignore: invalid_null_aware_operator
    7: ?--e1, // ignore: invalid_null_aware_operator
    8: ?--e2  // ignore: invalid_null_aware_operator
  };
  Expect.mapEquals({2: 1, 1: 3, 5: 2, 7: 1}, map1);

  var map2 = {
    ?++e1: ?++e1, // ignore: invalid_null_aware_operator
    ?++e2: ?++e2, // ignore: invalid_null_aware_operator
    ?--e1: ?--e1, // ignore: invalid_null_aware_operator
    ?--e2: ?--e2  // ignore: invalid_null_aware_operator
  };
  Expect.mapEquals({2: 1}, map2);
}
