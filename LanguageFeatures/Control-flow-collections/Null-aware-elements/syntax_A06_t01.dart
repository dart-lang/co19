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
/// @description Check that `this` and `super` can be used in an expression in a
/// `nullAwareMapElement` and a `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class A {
  String? foo(int i) => "A.foo($i)";
  String? operator [](int index) => "A[$index]";
}

class C extends A {
  void test() {
    var l = [
      ?this.foo(1),
      ?this[1],
      ?super.foo(2),
      ?super[2]
    ];
    Expect.listEquals(["A.foo(1)", "A[1]", "A.foo(2)", "A[2]"], l);
    var s = {
      ?this.foo(1),
      ?this[1],
      ?super.foo(2),
      ?super[2]
    };
    Expect.setEquals(["A.foo(1)", "A[1]", "A.foo(2)", "A[2]"], s);
    var m = {
      ?this.foo(1): "",
      ?this[1]: "",
      ?super.foo(2): "",
      ?super[2]: "",
      "1": ?this.foo(1),
      "2": ?this[1],
      "3": ?super.foo(2),
      "4": ?super[2],
      ?this.foo(3): ?this.foo(3),
      ?this[3]: ?this[3],
      ?super.foo(4): ?super.foo(4),
      ?super[4]: ?super[4]
    };
    Expect.mapEquals({
      "A.foo(1)": "",
      "A[1]": "",
      "A.foo(2)": "",
      "A[2]": "",
      "1": "A.foo(1)",
      "2": "A[1]",
      "3": "A.foo(2)",
      "4": "A[2]",
      "A.foo(3)": "A.foo(3)",
      "A[3]": "A[3]",
      "A.foo(4)": "A.foo(4)",
      "A[4]": "A[4]"
    }, m);
  }
}

main() {
  C().test();
}
