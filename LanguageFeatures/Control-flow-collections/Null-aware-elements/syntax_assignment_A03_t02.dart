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
/// `⟨assignableExpression⟩ ⟨assignmentOperator⟩ ⟨expression⟩`. Test list, map
/// and object patterns assignment.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

class C {
  final int? v;
  const C(this.v);

  @override
  bool operator ==(Object? other) {
    if (other is C) {
      return v == other.v;
    }
    return false;
  }
  @override
  String toString() => "C($v)";
}

main() {
  int? a, b, c, d, e, f;
  const m1 = {"key1": 2};
  const m2 = {"key2": null};
  const l1 = [1];
  const l2 = [null];
  const c1 = C(3);
  const c2 = C(null);

  var list = [
    ?[a] = l1,
//  ^
// [analyzer] unspecified
    ?{"key1": b} = m1,
//  ^
// [analyzer] unspecified
    ?C(v: c) = c1,
//  ^
// [analyzer] unspecified
    ?[d] = l2,
//  ^
// [analyzer] unspecified
    ?{"key2": e} = m2,
//  ^
// [analyzer] unspecified
    ?C(v: f) = c2
//  ^
// [analyzer] unspecified
  ];
  Expect.listEquals([l1, m1, c1, l2, m2, c2], list);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var set = {
    ?[a] = l1,
//  ^
// [analyzer] unspecified
    ?{"key1": b} = m1,
//  ^
// [analyzer] unspecified
    ?C(v: c) = c1,
//  ^
// [analyzer] unspecified
    ?[d] = l2,
//  ^
// [analyzer] unspecified
    ?{"key2": e} = m2,
//  ^
// [analyzer] unspecified
    ?C(v: f) = c2
//  ^
// [analyzer] unspecified
  };
  Expect.setEquals({l1, m1, c1, l2, m2, c2}, set);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var map1 = {
    ?[a] = l1: 1,
//  ^
// [analyzer] unspecified
    ?{"key1": b} = m1: 2,
//  ^
// [analyzer] unspecified
    ?C(v: c) = c1: 3,
//  ^
// [analyzer] unspecified
    ?[d] = l2: 4,
//  ^
// [analyzer] unspecified
    ?{"key2": e} = m2: 5,
//  ^
// [analyzer] unspecified
    ?C(v: f) = c2: 6
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({l1: 1, m1: 2, c1: 3, l2: 4, m2: 5, c2: 6}, map1);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var map2 = {
    1: ?[a] = l1,
//     ^
// [analyzer] unspecified
    2: ?{"key1": b} = m1,
//     ^
// [analyzer] unspecified
    3: ?C(v: c) = c1,
//     ^
// [analyzer] unspecified
    4: ?[d] = l2,
//     ^
// [analyzer] unspecified
    5: ?{"key2": e} = m2,
//     ^
// [analyzer] unspecified
    6: ?C(v: f) = c2
//     ^
// [analyzer] unspecified
  };
  Expect.mapEquals({1: l1, 2: m1, 3: c1, 4: l2, 5: m2, 6: c2}, map2);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var map3 = {
    ?[a] = l1: ?[a] = l1,
//  ^
// [analyzer] unspecified
    ?{"key1": b} = m1: ?{"key1": b} = m1,
//  ^
// [analyzer] unspecified
    ?C(v: c) = c1: ?C(v: c) = c1,
//  ^
// [analyzer] unspecified
    ?[d] = l2: ?[d] = l2,
//  ^
// [analyzer] unspecified
    ?{"key2": e} = m2: ?{"key2": e} = m2,
//  ^
// [analyzer] unspecified
    ?C(v: f) = c2: ?C(v: f) = c2
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({l1: l1, m1: m1, c1: c1, l2: l2, m2: m2, c2: c2}, map3);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);
}
