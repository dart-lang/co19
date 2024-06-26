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
/// @description Check that it is not a syntax error to use an equal expression
/// as an expression in a `nullAwareMapElement` or `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

class A {
  int? value;
  A(this.value);

  @override
  bool operator ==(Object? other) => value == other;
}

class C extends A {
  C(super.value);

  void test(int? expected) {
    var list = [
      ?super == expected,
//    ^
// [analyzer] unspecified
      ?super != expected
//    ^
// [analyzer] unspecified
    ];
    if (expected != null) {
      Expect.listEquals([true, false], list);
    } else {
      Expect.listEquals([false, true], list);
    }

    var set = {
      ?super == expected,
//    ^
// [analyzer] unspecified
      ?super != expected
//    ^
// [analyzer] unspecified
    };
    Expect.setEquals({false, true}, set);

    var map1 = {
      ?super == expected: 1,
//    ^
// [analyzer] unspecified
      ?super != expected: 2,
//    ^
// [analyzer] unspecified
      3: ?super == expected,
//       ^
// [analyzer] unspecified
      4: ?super != expected,
//       ^
// [analyzer] unspecified
    };
    if (expected != null) {
      Expect.mapEquals({true: 1, false: 2, 3: true, 4: false}, map1);
    } else {
      Expect.mapEquals({false: 1, true: 2, 3: false, 4: true}, map1);
    }

    var map2 = {
      ?super == expected: ?super == expected,
//    ^
// [analyzer] unspecified
      ?super != expected: ?super != expected
//    ^
// [analyzer] unspecified
    };
    Expect.mapEquals({true: true, false: false}, map2);
  }
}

main() {
  int? e1 = 2 > 1 ? 1 : null; // 1
  int? e2 = 1 > 2 ? 1 : null; // null

  var list = [
    ?e1 == e2,
    ?e2 != e1
  ];
  Expect.listEquals([false, true], list);

  var set = {
    ?e1 == e2,
    ?e2 != e1
  };
  Expect.setEquals({false, true}, set);

  var map1 = {
    ?e1 == e2: 1,
    ?e2 != e1: 2,
    3: ?e1 == e2,
    4: ?e2 != e1,
  };
  Expect.mapEquals({false: 1, true: 2, 3: false, 4: true}, map1);

  var map2 = {
    ?e1 == e2: ?e1 == e2,
    ?e2 != e1: ?e2 != e1
  };
  Expect.mapEquals({false: false, true: true}, map2);

  C(1).test(1);
  C(null).test(null);
}
