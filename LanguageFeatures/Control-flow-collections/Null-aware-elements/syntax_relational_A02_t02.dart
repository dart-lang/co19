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
/// @description Check that an `as` relational expression can be used as an
/// expression in a `nullAwareMapElement` or `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

main() {
  int? e1 = 2 > 1 ? 1 : null; // 1
  int? e2 = 1 > 2 ? 1 : null; // null

  var list = [
    ?e1 as Object?,
    ?e2 as Object?
  ];
  Expect.listEquals([1], list);

  var set = {
    ?e1 as Object?,
    ?e2 as Object?
  };
  Expect.setEquals({1}, set);

  var map1 = {
    ?e1 as Object?: 1,
    ?e2 as Object?: 2,
    3: ?e1 as Object?,
    4: ?e2 as Object?
  };
  Expect.mapEquals({1: 1, 3: 1}, map1);

  var map2 = {
    ?e1 as Object?: ?e1 as Object?,
    ?e2 as Object?: ?e2 as Object?,
  };
  Expect.mapEquals({1: 1}, map2);
}
