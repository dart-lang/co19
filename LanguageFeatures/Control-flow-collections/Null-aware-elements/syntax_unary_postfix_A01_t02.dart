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
/// @description Check that an unary postfix expression in the form `e++` and
/// `e--` can be used as an expression in a `nullAwareMapElement` or
/// `nullAwareExpressionElement`. Test property
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

extension on int? {
  int? operator +(int? other) {
    if (other != null && this != null) {
      return this! + other;
    }
    return null;
  }
  int? operator -(int? other) {
    if (other != null && this != null) {
      return this! - other;
    }
    return null;
  }
}

class A {
  int? v;
  A(this.v);
}

class C extends A {
  C(int? v) : super(v);

  void test(int? expected) {
    var list = [
      ?super.v++,
      ?super.v--
    ];
    if (expected != null) {
      Expect.listEquals([expected, expected + 1], list);
    } else {
      Expect.listEquals([], list);
    }

    var set = {
      ?super.v++,
      ?super.v--,
    };
    if (expected != null) {
      Expect.setEquals({expected, expected + 1}, set);
    } else {
      Expect.setEquals({}, set);
    }

    var map1 = {
      ?super.v++: 1,
      ?super.v--: 2,
      3: ?super.v++,
      4: ?super.v--
    };
    if (expected != null) {
      Expect.mapEquals(
          {expected: 1, expected + 1: 2, 3: expected, 4: expected + 1}, map1);
    } else {
      Expect.mapEquals({}, map1);
    }

    var map2 = {
      ?super.v++: ?super.v++,
      ?super.v--: ?super.v--,
    };
    if (expected != null) {
      Expect.mapEquals(
          {expected: expected + 1, expected + 2: expected + 1}, map2);
    } else {
      Expect.mapEquals({}, map2);
    }
  }
}

main() {
  var list = [
    ?C(1).v++,
    ?C(null).v++,
    ?C(2).v--,
    ?C(null).v--
  ];
  Expect.listEquals([1, 2], list);

  var set = {
    ?C(1).v++,
    ?C(null).v++,
    ?C(2).v--,
    ?C(null).v--
  };
  Expect.setEquals({1, 2}, set);

  var map1 = {
    ?C(1).v++: 1,
    ?C(null).v++: 2,
    ?C(2).v--: 3,
    ?C(null).v--: 4,
    5: ?C(1).v++,
    6: ?C(null).v++,
    7: ?C(2).v--,
    8: ?C(null).v--
  };
  Expect.mapEquals({1: 1, 2: 3, 5: 1, 7: 2}, map1);

  var map2 = {
    ?C(1).v++: ?C(1).v++,
    ?C(null).v++: ?C(null).v++,
    ?C(2).v--: ?C(2).v--,
    ?C(null).v--: ?C(null).v--
  };
  Expect.mapEquals({1: 1, 2: 2}, map2);

  C(1).test(1);
  C(null).test(null);
}
