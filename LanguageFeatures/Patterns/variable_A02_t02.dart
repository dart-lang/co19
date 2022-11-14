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
/// variable's type is inferred and the pattern matches all values. Test the
/// case when type, `var` and `final` are omitted
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";
import "patterns_lib.dart";

String testRecord(Record r, [bool doTypeTest = false]) {
  switch (r) {
    case (a, b):
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
    case [a, b]:
      if (doTypeTest) {
        a.expectStaticType<Exactly<int>>();
        b.expectStaticType<Exactly<String>>();
      }
      return "[$a, $b]";
    default:
      return "default";
  }
}

String testMap(Map m) {
  switch (m) {
    case {1: a}:
      a.expectStaticType<Exactly<int>>();
      return "{1: $a}";
    case {2: b}:
      b.expectStaticType<Exactly<String>>();
      return "{2: $b}";
    default:
      return "default";
  }
}

String testObject(Shape shape) {
  switch (shape) {
    case Square(area: a):
      return "a=$a";
    case Rectangle(area: b):
      return "b=$b";
    default:
      return "default";
  }
}

main() {
  Expect.equals("(1, x)", testRecord((1, "x"), true));
  Expect.equals("(1, 2)", testRecord((1, 2)));
  Expect.equals("(true, false)", testRecord((true, false)));
  Expect.equals("default", testRecord((1, 2, 3)));
  Expect.equals("default", testRecord(("x",)));

  Expect.equals("[1, x]", testList([1, "x"], true));
  Expect.equals("[1, 2]", testList([1, 2]));
  Expect.equals("[true, false]", testList([true, false]));
  Expect.equals("default", testList([1, 2, 3]));
  Expect.equals("default", testList(["x"]));

  Expect.equals("{1: 2}", testMap({1: 2}));
  Expect.equals("{1: 3}", testMap({1: 3, 3: 4}));
  Expect.equals("{2: x}", testMap({2: "x"}));
  Expect.equals("{2: true}", testMap({2: true}));
  Expect.equals("default", testMap({3: 3}));
  Expect.equals("default", testMap({}));

  Expect.equals("a=1.00", testObject(Square(1)));
  Expect.equals("a=4.00", testObject(Square(2)));
  Expect.equals("b=2.00", testObject(Rectangle(1, 2)));
  Expect.equals("b=4.00", testObject(Rectangle(2, 2)));
  Expect.equals("default", testObject(Circle(1)));
  Expect.equals("default", testObject(Shape()));
}
