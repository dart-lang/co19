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
/// `nullAwareExpressionElement` can be in a form `super / e2`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class A {
  double value;
  A(this.value);

  double? operator /(double? other) {
    if (other != null) {
      return value / other;
    }
    return null;
  }
}

class C extends A {
  C() : super(1.0);

  void test() {
    var list = [
      ?super / 1,
      ?super / null
    ];
    Expect.listEquals([1], list);

    var set = {
      ?super / 1,
      ?super / null
    };
    Expect.setEquals({1}, set);

    var map1 = {
      ?super / 1: 1,
      2: ?super / 1,
      ?super / null: 3,
      4: ?super / null
    };
    Expect.mapEquals({1: 1, 2: 1}, map1);

    var map2 = {
      ?super / 1: ?super / 1,
      ?super / null: ?super / null
    };
    Expect.mapEquals({1: 1}, map2);
  }
}

main() {
  C().test();
}
