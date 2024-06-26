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

class A {
  int id;
  A(this.id);

  bool? operator >(A? other) {
    if (other != null) {
      return id > other.id;
    }
    return null;
  }
  bool? operator <(A? other) {
    if (other != null) {
      return id < other.id;
    }
    return null;
  }
  bool? operator >=(A? other) {
    if (other != null) {
      return id >= other.id;
    }
    return null;
  }
  bool? operator <=(A? other) {
    if (other != null) {
      return id <= other.id;
    }
    return null;
  }
}

class C extends A {
  C() : super(1);

  void test() {
    var list = [
      ?super > A(0),
      ?super > null,
      ?super >= A(1),
      ?super >= null,
      ?super < A(0),
      ?super < null,
      ?super <= A(1),
      ?super <= null
    ];
    Expect.listEquals([true, true, false, true], list);

    var set1 = {
      ?super > A(0),
      ?super > null,
      ?super >= A(2),
      ?super >= null
    };
    Expect.setEquals({true, false}, set1);

    var set2 = {
      ?super < A(0),
      ?super < null,
      ?super <= A(1),
      ?super <= null
    };
    Expect.setEquals({true, false}, set1);

    var map1 = {
      ?super < A(0): 1,
      ?super < null: 2,
      ?super <= A(1): 3,
      ?super <= null: 4
    };
    Expect.mapEquals({false: 1, true: 3}, map1);

    var map2 = {
      ?super > A(0): 1,
      ?super > null: 2,
      ?super >= A(2): 3,
      ?super >= null: 4
    };
    Expect.mapEquals({true: 1, false: 3}, map2);

    var map3 = {
      1: ?super < A(0),
      2: ?super < null,
      3: ?super <= A(1),
      4: ?super <= null,
      5: ?super > A(0),
      6: ?super > null,
      7: ?super >= A(1),
      8: ?super >= null,
    };
    Expect.mapEquals({1: false, 3: true, 5: true, 7: true}, map3);

    var map4 = {
      ?super < A(0): ?super > A(0),
      ?super < null: ?super > null,
      ?super <= A(1): ?super >= A(2),
      ?super <= null: ?super >= null
    };
    Expect.mapEquals({true: false, false: true}, map4);
  }
}

main() {
  C().test();
}
