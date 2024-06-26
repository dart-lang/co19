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
/// @description Check that unary prefix expressions in the form `~e` and `-e`
/// can be used as an expression in a `nullAwareMapElement` or
/// `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

class C {
  int? value;
  C(this.value);

  int? operator ~() => value;
  int? operator -() => value;
}

main() {
  var list = [
    ?~C(1),
    ?~C(null),
    ?-C(2),
    ?-C(null)
  ];
  Expect.listEquals([1, 2], list);

  var set = {
    ?~C(1),
    ?~C(null),
    ?-C(2),
    ?-C(null)
  };
  Expect.setEquals({1, 2}, set);

  var map1 = {
    ?~C(1): 1,
    ?~C(null): 2,
    3: ?~C(3),
    4: ?~C(null),
    ?~C(5): ?~C(5),
    ?~C(null): ?~C(null)
  };
  Expect.mapEquals({1: 1, 3: 3, 5: 5}, map1);

  var map2 = {
    ?-C(1): 1,
    ?-C(null): 2,
    3: ?-C(3),
    4: ?-C(null),
    ?-C(5): ?-C(5),
    ?-C(null): ?-C(null)
  };
  Expect.mapEquals({1: 1, 3: 3, 5: 5}, map2);
}
