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
/// `nullAwareExpressionElement` can be in a form `super + e`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class A {
  int value;
  A(this.value);

  int? operator +(int? other) {
    if (other != null) {
      return value + other;
    }
    return null;
  }

  int? operator -(int? other) {
    if (other != null) {
      return value - other;
    }
    return null;
  }
}

class C extends A {
  C() : super(1);

  void test() {
    var list = [
      ?super + 1,
      ?super - 1,
      ?super + null,
      ?super - null,
    ];
    Expect.listEquals([2, 0], list);

    var set = {
      ?super + 1,
      ?super - 1,
      ?super + null,
      ?super - null,
    };
    Expect.setEquals({2, 0}, set);

    var map1 = {
      ?super + 1: 1,
      ?super - 1: 2,
      ?super + null: 3,
      ?super - null: 4,
      5: ?super + 1,
      6: ?super - 1,
      7: ?super + null,
      8: ?super - null
    };
    Expect.mapEquals({2: 1, 0: 2, 5: 2, 6: 0}, map1);

    var map2 = {
      ?super + 1: ?super + 1,
      ?super - 1: ?super - 1,
      ?super + null: ?super + null,
      ?super - null: ?super - null,
    };
    Expect.mapEquals({2: 2, 0: 0}, map2);
  }
}

main() {
  C().test();
}
