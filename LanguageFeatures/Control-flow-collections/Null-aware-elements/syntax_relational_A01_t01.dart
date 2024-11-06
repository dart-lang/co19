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
/// `nullAwareExpressionElement` can be a relational expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

class C {
  int id;
  C(this.id);

  bool? operator >(C? other) {
    if (other != null) {
      return id > other.id;
    }
    return null;
  }
  bool? operator <(C? other) {
    if (other != null) {
      return id < other.id;
    }
    return null;
  }
  bool? operator >=(C? other) {
    if (other != null) {
      return id >= other.id;
    }
    return null;
  }
  bool? operator <=(C? other) {
    if (other != null) {
      return id <= other.id;
    }
    return null;
  }
}

main() {
  var list = [
    ?C(1) > C(0),
    ?C(1) > null,
    ?C(1) >= C(1),
    ?C(1) >= null,
    ?C(1) < C(0),
    ?C(1) < null,
    ?C(1) <= C(1),
    ?C(1) <= null
  ];
  Expect.listEquals([true, true, false, true], list);

  var set1 = {
    ?C(1) > C(0),
    ?C(1) > null,
    ?C(1) >= C(2),
    ?C(1) >= null
  };
  Expect.setEquals({true, false}, set1);

  var set2 = {
    ?C(1) < C(0),
    ?C(1) < null,
    ?C(2) <= C(1),
    ?C(1) <= null
  };
  Expect.setEquals({false}, set2);

  var map1 = {
    ?C(1) < C(0): 1,
    ?C(1) < null: 2,
    ?C(1) <= C(1): 3,
    ?C(1) <= null: 4
  };
  Expect.mapEquals({false: 1, true: 3}, map1);

  var map2 = {
    ?C(1) > C(0): 1,
    ?C(1) > null: 2,
    ?C(1) >= C(2): 3,
    ?C(1) >= null: 4
  };
  Expect.mapEquals({true: 1, false: 3}, map2);

  var map3 = {
    1: ?C(1) < C(0),
    2: ?C(1) < null,
    3: ?C(1) <= C(1),
    4: ?C(1) <= null,
    5: ?C(1) > C(0),
    6: ?C(1) > null,
    7: ?C(1) >= C(1),
    8: ?C(1) >= null,
  };
  Expect.mapEquals({1: false, 3: true, 5: true, 7: true}, map3);

  var map4 = {
    ?C(1) < C(0): ?C(1) > C(0),
    ?C(1) < null: ?C(1) > null,
    ?C(1) <= C(1): ?C(1) >= C(2),
    ?C(1) <= null: ?C(1) >= null
  };
  Expect.mapEquals({true: false, false: true}, map4);
}
