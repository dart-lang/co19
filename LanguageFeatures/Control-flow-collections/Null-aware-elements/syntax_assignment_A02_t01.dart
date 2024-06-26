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
/// `⟨assignableExpression⟩ ⟨assignmentOperator⟩ ⟨expression⟩`. Test assignment
/// to a property.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

class A {
  int? x = null;
  void operator []=(int index, int? value) {}
}

class C extends A {
  test() {
    int? e1 = 2 > 1 ? 1 : null; // 1
    int? e2 = 2 > 1 ? null : 1; // null

    var list = [
      ?super.x = e1,
      ?super.x = e2,
      ?super[1] = e1,
      ?super[1] = e2
    ];
    Expect.listEquals([e1, e1], list);

    var set = {
      ?super.x = e1,
      ?super.x = e2,
      ?super[1] = e1,
      ?super[1] = e2
    };
    Expect.setEquals({e1}, set);

    var map1 = {
      ?super.x = e1: 1,
      ?super.x = e2: 2,
      ?super[1] = e1: 3,
      ?super[1] = e2: 4,
      5: ?super.x = e1,
      6: ?super.x = e2,
      7: ?super[1] = e1,
      8: ?super[1] = e2
    };
    Expect.mapEquals({e1: 3, 5: e1, 7: e1}, map1);

    var map2 = {
      ?super.x = e1: ?super.x = e1,
      ?super.x = e2: ?super.x = e2,
      ?super[1] = e1: ?super[1] = e1,
      ?super[1] = e2: ?super[1] = e2
    };
    Expect.mapEquals({e1: e1}, map2);
  }
}

main() {
  int? e1 = 2 > 1 ? 1 : null; // 1
  int? e2 = 2 > 1 ? null : 1; // null
  C c1 = C();
  C? c2 = null;

  var list = [
    ?c1.x = e1,
    ?c2?.x = e1,
    ?c1.x = e2,
    ?c2?.x = e2,
    ?c1[1] = e1,
    ?c2?[1] = e1,
    ?c1[1] = e2,
    ?c2?[1] = e2
  ];
  Expect.listEquals([e1, e1], list);

  var set = {
    ?c1.x = e1,
    ?c2?.x = e1,
    ?c1.x = e2,
    ?c2?.x = e2,
    ?c1[1] = e1,
    ?c2?[1] = e1,
    ?c1[1] = e2,
    ?c2?[1] = e2
  };
  Expect.setEquals({e1}, set);

  var map1 = {
    ?c1.x = e1: 1,
    ?c2?.x = e1: 2,
    ?c1.x = e2: 3,
    ?c2?.x = e2: 4,
    ?c1[1] = e1: 5,
    ?(c2?[1] = e1): 6,
    ?c1[1] = e2: 7,
    ?(c2?[1] = e2): 8,
    9: ?c1.x = e1,
    10: ?c2?.x = e1,
    11: ?c1.x = e2,
    12: ?c2?.x = e2,
    13: ?c1[1] = e1,
    14: ?c2?[1] = e1,
    15: ?c1[1] = e2,
    16: ?c2?[1] = e2
  };
  Expect.mapEquals({e1: 5, 9: e1, 13: e1}, map1);

  var map2 = {
    ?c1.x = e1: ?c1.x = e1,
    ?c2?.x = e1: ?c2?.x = e1,
    ?c1.x = e2: ?c1.x = e2,
    ?c2?.x = e2: ?c2?.x = e2,
    ?c1[1] = e1: ?c1[1] = e1,
    ?(c2?[1] = e1): ?(c2?[1] = e1),
    ?c1[1] = e2: ?c1[1] = e2,
    ?(c2?[1] = e2): ?(c2?[1] = e2)
  };
  Expect.mapEquals({e1: 1}, map2);

  C().test();
}
