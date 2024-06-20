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

class A {
  int value;
  A(this.value);

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

class C extends A {
  C() : super(4);

  void test() {
    var list = [
      ?super | 1,
      ?super | null,
      ?super & 1,
      ?super & null,
      ?super ^ 1,
      ?super ^ null
    ];
    Expect.listEquals([5, 0, 5], list);

    var set = {
      ?super | 1,
      ?super | null,
      ?super & 1,
      ?super & null,
      ?super ^ 1,
      ?super ^ null
    };
    Expect.setEquals({5, 0}, set);

    var map1 = {
      ?super | 1: 1,
      ?super | null: 2,
      ?super & 1: 3,
      ?super & null: 4,
      ?super ^ 1: 5,
      ?super ^ null: 6
    };
    Expect.mapEquals({5: 5, 0: 3}, map1);

    var map2 = {
      1: ?super | 1,
      2: ?super | null,
      3: ?super & 1,
      4: ?super & null,
      5: ?super ^ 1,
      6: ?super ^ null
    };
    Expect.mapEquals({1: 5, 3: 0, 5: 5}, map2);

    var map3 = {
      ?super | 1: ?super | 1,
      ?super | null: ?super | null,
      ?super & 1: ?super & 1,
      ?super & null: ?super & null,
      ?super ^ 1: ?super ^ 1,
      ?super ^ null: ?super ^ null
    };
    Expect.mapEquals({5: 5, 0: 0}, map3);
  }
}

main() {
  C().test();
}
