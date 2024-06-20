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
/// @description Check that a bitwise expression can be used as an expression in
/// a `nullAwareMapElement` or `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C {
  int value;
  C(this.value);

  int? operator |(int? v) {
    if (v != null) {
      return value | v;
    }
    return null;
  }
  int? operator &(int? v) {
    if (v != null) {
      return value & v;
    }
    return null;
  }
  int? operator ^(int? v) {
    if (v != null) {
      return value ^ v;
    }
    return null;
  }
}

main() {
  var list = [
    ?C(4) | 1,
    ?C(4) | null,
    ?C(4) & 1,
    ?C(4) & null,
    ?C(2) ^ 1,
    ?C(4) ^ null
  ];
  Expect.listEquals([5, 0, 3], list);

  var set = {
    ?C(4) | 1,
    ?C(4) | null,
    ?C(4) & 1,
    ?C(4) & null,
    ?C(2) ^ 1,
    ?C(4) ^ null
  };
  Expect.setEquals({5, 0, 3}, set);

  var map1 = {
    ?C(4) | 1: 1,
    ?C(4) | null: 2,
    ?C(4) & 1: 3,
    ?C(4) & null: 4,
    ?C(2) ^ 1: 5,
    ?C(4) ^ null: 6
  };
  Expect.mapEquals({5: 1, 0: 3, 3: 5}, map1);

  var map2 = {
    1: ?C(4) | 1,
    2: ?C(4) | null,
    3: ?C(4) & 1,
    4: ?C(4) & null,
    5: ?C(2) ^ 1,
    6: ?C(4) ^ null
  };
  Expect.mapEquals({1: 5, 3: 0, 5: 3}, map2);

  var map3 = {
    ?C(4) | 1: ?C(4) | 1,
    ?C(4) | null: ?C(4) | null,
    ?C(4) & 1: ?C(4) & 1,
    ?C(4) & null: ?C(4) & null,
    ?C(2) ^ 1: ?C(2) ^ 1,
    ?C(4) ^ null: ?C(4) ^ null
  };
  Expect.mapEquals({5: 5, 0: 0, 3: 3}, map3);
}
