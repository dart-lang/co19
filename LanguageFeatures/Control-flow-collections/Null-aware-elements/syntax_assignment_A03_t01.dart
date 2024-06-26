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
/// `⟨assignableExpression⟩ ⟨assignmentOperator⟩ ⟨expression⟩`. Test
/// parenthesized and record patterns assignment.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

main() {
  int? a, b, c, d, e, f;

  var list = [
    ?(a) = 1,
//  ^
// [analyzer] unspecified
    ?(b,) = (2,),
//  ^
// [analyzer] unspecified
    ?(name: c) = (name: 3),
//  ^
// [analyzer] unspecified
    ?(d) = null,
    ?(e,) = (null,),
//  ^
// [analyzer] unspecified
    ?(name: f) = (name: null)
//  ^
// [analyzer] unspecified
  ];
  Expect.listEquals([1, (2,), (name: 3), (null,), (name: null)], list);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var set = {
    ?(a) = 1,
//  ^
// [analyzer] unspecified
    ?(b,) = (2,),
//  ^
// [analyzer] unspecified
    ?(name: c) = (name: 3),
//  ^
// [analyzer] unspecified
    ?(d) = null,
    ?(e,) = (null,),
//  ^
// [analyzer] unspecified
    ?(name: f) = (name: null)
//  ^
// [analyzer] unspecified
  };
  Expect.setEquals({1, (2,), (name: 3), (null,), (name: null)}, set);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var map1 = {
    ?(a) = 1 : 1,
//  ^
// [analyzer] unspecified
    ?(b,) = (2,): 2,
//  ^
// [analyzer] unspecified
    ?(name: c) = (name: 3): 3,
//  ^
// [analyzer] unspecified
    ?(d) = null: 4,
    ?(e,) = (null,): 5,
//  ^
// [analyzer] unspecified
    ?(name: f) = (name: null): 6
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals(
      {1: 1, (2,): 2, (name: 3): 3, (null,): 5, (name: null): 6}, map1);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var map2 = {
    1: ?(a) = 1,
//     ^
// [analyzer] unspecified
    2: ?(b,) = (2,),
//     ^
// [analyzer] unspecified
    3: ?(name: c) = (name: 3),
//     ^
// [analyzer] unspecified
    4: ?(d) = null,
    5: ?(e,) = (null,),
//     ^
// [analyzer] unspecified
    6: ?(name: f) = (name: null)
//     ^
// [analyzer] unspecified
  };
  Expect.mapEquals(
      {1: 1, 2: (2,), 3: (name: 3), 5: (null,), 6: (name: null)}, map2);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);

  var map3 = {
    ?(a) = 1: ?(a) = 1,
//  ^
// [analyzer] unspecified
    ?(b,) = (2,): ?(b,) = (2,),
//  ^
// [analyzer] unspecified
    ?(name: c) = (name: 3): ?(name: c) = (name: 3),
//  ^
// [analyzer] unspecified
    ?(d) = null: ?(d) = null,
    ?(e,) = (null,): ?(e,) = (null,),
//  ^
// [analyzer] unspecified
    ?(name: f) = (name: null): ?(name: f) = (name: null)
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({
    1: 1,
    (2,): (2,),
    (name: 3): (name: 3),
    (null,): (null,),
    (name: null): (name: null)
  }, map3);
  Expect.equals(1, a);
  Expect.equals(2, b);
  Expect.equals(3, c);
  Expect.isNull(d);
  Expect.isNull(e);
  Expect.isNull(f);
}
