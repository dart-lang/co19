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
/// `nullAwareExpressionElement` can be a switch expression.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  int? e1 = 2 > 1 ? 1: null; // 1
  int? e2 = 1 > 2 ? 1: null; // null

  var list = [
    ?switch(e1) {
      1 => 1,
      _ => null
    },
    ?switch(e2) {
      1 => 1,
      _ => null
    }
  ];
  Expect.listEquals([1], list);

  var set = {
    ?switch(e1) {
      1 => 1,
      _ => null
    },
    ?switch(e2) {
      1 => 1,
      _ => null
    }
  };
  Expect.setEquals({1}, set);

  var map1 = {
    ?switch(e1) {
      1 => 1,
      _ => null
    }: 1,
    ?switch(e2) {
      1 => 1,
      _ => null
    }: 2,
    3: ?switch(e1) {
      1 => 1,
      _ => null
    },
    4: ?switch(e2) {
      1 => 1,
      _ => null
    },
  };
  Expect.mapEquals({1: 1, 3: 1}, map1);

  var map2 = {
    ?switch(e1) {
      1 => 1,
      _ => null
    }: ?switch(e1) {
      1 => 1,
      _ => null
    },
    ?switch(e2) {
      1 => 1,
      _ => null
    }: ?switch(e2) {
      1 => 1,
      _ => null
    }
  };
  Expect.mapEquals({1: 1}, map2);
}
