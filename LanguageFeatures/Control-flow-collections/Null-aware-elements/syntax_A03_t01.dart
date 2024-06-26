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
/// @description Check that `nullAwareExpressionElement` `?` affects the
/// whole expression, not just the first token
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

extension on int? {
  int? operator +(int other) {
    if (this != null) {
      return other + this!;
    }
    return null;
  }
}

main() {
  int? e = 2 > 1 ? 1 : null;

  var list = <int>[
    ? e + 1,
    ?(e) + 1
  ];
  Expect.listEquals([2, 3], list);

  var set = <int>{
    ? e + 1,
    ?(e) + 2
  };
  Expect.setEquals({2, 3}, set);

  var map = <int, int>{
    0: ? e - 1,
    1: ? (e) + 0,
    ? e + 1: 2,
    ? (e) + 2: 3,
  };
  Expect.mapEquals({0: 0, 1: 1, 2: 2, 3: 3}, map);
}
