// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// variablePattern ::= ( 'var' | 'final' | 'final'? type )? identifier
///
/// A variable pattern binds the matched value to a new variable. These usually
/// occur as subpatterns of a destructuring pattern in order to capture a
/// destructured value.
/// ```dart
/// var (a, b) = (1, 2);
/// ```
/// Here, a and b are variable patterns and end up bound to 1 and 2,
/// respectively.
///
/// The pattern may have a type annotation in order to only match values of the
/// specified type. If the type annotation is omitted, the variable's type is
/// inferred and the pattern matches all values.
/// ```dart
/// switch (record) {
///   case (int x, String s):
///     print('First field is int $x and second is String $s.');
/// }
/// ```
/// @description Check that if the type annotation is omitted then the
/// variable's type is inferred and the pattern matches all values
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

String testRecord(Record r, [bool doTypeTest = false]) {
  switch (r) {
    case (var a, final b):
      if (doTypeTest) {
        a.expectStaticType<Exactly<int>>();
        b.expectStaticType<Exactly<String>>();
      }
      return "($a, $b)";
    default:
      return "default";
  }
}

String testList(List l, [bool doTypeTest = false]) {
  switch (l) {
    case [var a, final b]:
      if (doTypeTest) {
        a.expectStaticType<Exactly<int>>();
        b.expectStaticType<Exactly<String>>();
      }
      return "[$a, $b]";
    default:
      return "default";
  }
}

String testMap(Map m, [bool doTypeTest = false]) {
  switch (m) {
    case {var a: final b}:
      if (doTypeTest) {
        a.expectStaticType<Exactly<int>>();
        b.expectStaticType<Exactly<String>>();
      }
      return "{$a: $b}";
    default:
      return "default";
  }
}

String testSet(Set s, [bool doTypeTest = false]) {
  switch (s) {
    case {var a, final b}:
      if (doTypeTest) {
        a.expectStaticType<Exactly<int>>();
        b.expectStaticType<Exactly<String>>();
      }
      return "{$a, $b}";
    default:
      return "default";
  }
}

main() {
  Expect.equals("[1, x]", testRecord((1, "x"), true));
  Expect.equals("[1, 2]", testRecord((1, 2)));
  Expect.equals("[true, false]", testRecord((true, false)));
  Expect.equals("default", testRecord((1, 2, 3)));
  Expect.equals("default", testRecord(("x",)));

  Expect.equals("(1, x)", testList([1, "x"], true));
  Expect.equals("(1, 2)", testList([1, 2]));
  Expect.equals("[true, false]", testList([true, false]));
  Expect.equals("default", testList([1, 2, 3]));
  Expect.equals("default", testList(["x"]));

  Expect.equals("{1: x}", testMap({1: "x"}, true));
  Expect.equals("{1: 2}", testMap({1: 2}));
  Expect.equals("{true: false}", testMap({true: false}));
  Expect.equals("default", testMap({1: 2, 3: 4}));
  Expect.equals("default", testMap({}));

  Expect.equals("{1, x}", testSet({1, "x"}, true));
  Expect.equals("{1, 2}", testSet({1, 2}));
  Expect.equals("{true, false}", testSet({true, false}));
  Expect.equals("default", testSet({1, 2, 3}));
  Expect.equals("default", testSet({"x"}));
}
