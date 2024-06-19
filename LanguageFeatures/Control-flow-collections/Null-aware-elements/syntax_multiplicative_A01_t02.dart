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
/// `nullAwareExpressionElement` can be in a form `super * e2`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class A {
  int value;
  A(this.value);

  int? operator *(int? other) {
    if (other != null) {
      return value * other;
    }
    return null;
  }

  int? operator %(int? other) {
    if (other != null) {
      return value % other;
    }
    return null;
  }

  int? operator ~/(int? other) {
    if (other != null) {
      return value ~/ other;
    }
    return null;
  }
}

class C extends A {
  C() : super(4);

  void test() {
    var list = [
      ?super * 1,
      ?super % 2,
      ?super ~/ 3,
      ?super * null,
      ?super % null,
      ?super % null,
    ];
    Expect.listEquals([4, 0, 1], list);

    var set = {
      ?super * 1,
      ?super % 2,
      ?super ~/ 3,
      ?super * null,
      ?super % null,
      ?super % null,
    };
    Expect.setEquals({4, 0, 1}, set);

    var map1 = {
      ?super * 1: 1,
      ?super % 2: 2,
      ?super ~/ 3: 3,
      ?super * null: 4,
      ?super % null: 5,
      ?super % null: 6,
      7: ?super * 1,
      8: ?super % 2,
      9: ?super ~/ 3,
      10: ?super * null,
      11: ?super % null,
      12: ?super % null,
    };
    Expect.mapEquals({4: 1, 0: 2, 1: 3, 7: 4, 8: 0, 9: 1}, map1);

    var map2 = {
      ?super * 1: ?super * 1,
      ?super % 2: ?super % 2,
      ?super ~/ 3: ?super ~/ 3,
      ?super * null: ?super * null,
      ?super % null: ?super % null,
      ?super ~/ null: ?super ~/ null,
    };
    Expect.mapEquals({4: 4, 0: 0, 1: 1}, map2);
  }
}

main() {
  C().test();
}
