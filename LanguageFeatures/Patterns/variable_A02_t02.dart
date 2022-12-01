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

String testRecord1(Record r, [bool doTypeTest = false]) {
  switch (r) {
    case (a, b):
      if (doTypeTest) {
        // Expecting a and b to be dynamic
        a.isOdd;
        b.substring(0);
        Expect.throws(() {a.whatever;}.);
        Expect.throws(() {b.whatever;}.);
      }
      return "($a, $b)";
    default:
      return "default";
  }
}

String testRecord2(Record r) {
  return switch (r) {
    case (a, b) => "($a, $b)";
    default => "default";
  };
}

String testRecord3(Record r, [bool doTypeTest = false]) {
  if (r case (a, b)) {
    if (doTypeTest) {
      a.isOdd;
      b.substring(0);
      Expect.throws(() {a.whatever;}.);
      Expect.throws(() {b.whatever;}.);
    }
    return "($a, $b)";
  } else {
    return "default";
  }
}

String testList1(List l, [bool doTypeTest = false]) {
  switch (l) {
    case [a, b]:
    if (doTypeTest) {
      a.isOdd;
      b.substring(0);
      Expect.throws(() {a.whatever;}.);
      Expect.throws(() {b.whatever;}.);
    }
    return "[$a, $b]";
    default:
      return "default";
  }
}

String testList2(List l) {
  return switch (l) {
    case [a, b] => "[$a, $b]";
    default => "default";
  };
}

String testList3(List l, [bool doTypeTest = false]) {
  if (l case [a, b]) {
    if (doTypeTest) {
      a.isOdd;
      b.substring(0);
      Expect.throws(() {a.whatever;}.);
      Expect.throws(() {b.whatever;}.);
    }
    return "[$a, $b]";
  } else {
    return "default";
  }
}

String testMap1(Map m) {
  switch (m) {
    case {1: a}:
      a.isOdd;
      Expect.throws(() {a.whatever;}.);
      return "{1: $a}";
    case {2: b}:
      b.substring(0);
      Expect.throws(() {b.whatever;}.);
      return "{2: $b}";
    default:
      return "default";
  }
}

String testMap2(Map m) {
  return switch (m) {
    case {1: a} => "{1: $a}";
    case {2: b} => "{2: $b}";
    default => "default";
  };
}

String testMap3(Map m) {
  if (m case {1: a}) {
    a.isOdd;
    Expect.throws(() {a.whatever;}.);
    return "{1: $a}";
  }
  if (m case {2: final b}) {
    b.substring(0);
    Expect.throws(() {b.whatever;}.);
    return "{2: $b}";
  } else {
    return "default";
  }
}

String testObject1(Shape shape) {
  switch (shape) {
    case Square(area: a):
      return "a=$a";
    case Rectangle(area: b):
      return "b=$b";
    default:
      return "default";
  }
}

String testObject2(Shape shape) {
  return switch (shape) {
    case Square(area: a) => "a=$a";
    case Rectangle(area: b) => "b=$b";
    default => "default";
  };
}

String testObject3(Shape shape) {
  if (shape case Square(area: a)) {
    return "a=$a";
  }
  if (shape case Rectangle(area: b)) {
    return "b=$b";
  } else {
    return "default";
  }
}

main() {
  Expect.equals("(1, x)", testRecord1((1, "x"), true));
  Expect.equals("(1, 2)", testRecord1((1, 2)));
  Expect.equals("(true, false)", testRecord1((true, false)));
  Expect.equals("default", testRecord1((1, 2, 3)));
  Expect.equals("default", testRecord1(("x",)));

  Expect.equals("(1, x)", testRecord2((1, "x")));
  Expect.equals("(1, 2)", testRecord2((1, 2)));
  Expect.equals("(true, false)", testRecord2((true, false)));
  Expect.equals("default", testRecord2((1, 2, 3)));
  Expect.equals("default", testRecord2(("x",)));

  Expect.equals("(1, x)", testRecord3((1, "x"), true));
  Expect.equals("(1, 2)", testRecord3((1, 2)));
  Expect.equals("(true, false)", testRecord3((true, false)));
  Expect.equals("default", testRecord3((1, 2, 3)));
  Expect.equals("default", testRecord3(("x",)));

  Expect.equals("[1, x]", testList1([1, "x"], true));
  Expect.equals("[1, 2]", testList1([1, 2]));
  Expect.equals("[true, false]", testList1([true, false]));
  Expect.equals("default", testList1([1, 2, 3]));
  Expect.equals("default", testList1(["x"]));

  Expect.equals("[1, x]", testList2([1, "x"]));
  Expect.equals("[1, 2]", testList2([1, 2]));
  Expect.equals("[true, false]", testList2([true, false]));
  Expect.equals("default", testList2([1, 2, 3]));
  Expect.equals("default", testList2(["x"]));

  Expect.equals("[1, x]", testList3([1, "x"]));
  Expect.equals("[1, 2]", testList3([1, 2]));
  Expect.equals("[true, false]", testList3([true, false]));
  Expect.equals("default", testList3([1, 2, 3]));
  Expect.equals("default", testList3(["x"]));

  Expect.equals("{1: 2}", testMap1({1: 2}));
  Expect.equals("{1: 3}", testMap1({1: 3, 3: 4}));
  Expect.equals("{2: x}", testMap1({2: "x"}));
  Expect.equals("{2: true}", testMap1({2: true}));
  Expect.equals("default", testMap1({3: 3}));
  Expect.equals("default", testMap1({}));

  Expect.equals("{1: 2}", testMap2({1: 2}));
  Expect.equals("{1: 3}", testMap2({1: 3, 3: 4}));
  Expect.equals("{2: x}", testMap2({2: "x"}));
  Expect.equals("{2: true}", testMap2({2: true}));
  Expect.equals("default", testMap2({3: 3}));
  Expect.equals("default", testMap2({}));

  Expect.equals("{1: 2}", testMap3({1: 2}));
  Expect.equals("{1: 3}", testMap3({1: 3, 3: 4}));
  Expect.equals("{2: x}", testMap3({2: "x"}));
  Expect.equals("{2: true}", testMap3({2: true}));
  Expect.equals("default", testMap3({3: 3}));
  Expect.equals("default", testMap3({}));

  Expect.equals("a=1.00", testObject1(Square(1)));
  Expect.equals("a=4.00", testObject1(Square(2)));
  Expect.equals("b=2.00", testObject1(Rectangle(1, 2)));
  Expect.equals("b=4.00", testObject1(Rectangle(2, 2)));
  Expect.equals("default", testObject1(Circle(1)));
  Expect.equals("default", testObject1(Shape()));

  Expect.equals("a=1.00", testObject2(Square(1)));
  Expect.equals("a=4.00", testObject2(Square(2)));
  Expect.equals("b=2.00", testObject2(Rectangle(1, 2)));
  Expect.equals("b=4.00", testObject2(Rectangle(2, 2)));
  Expect.equals("default", testObject2(Circle(1)));
  Expect.equals("default", testObject2(Shape()));

  Expect.equals("a=1.00", testObject3(Square(1)));
  Expect.equals("a=4.00", testObject3(Square(2)));
  Expect.equals("b=2.00", testObject3(Rectangle(1, 2)));
  Expect.equals("b=4.00", testObject3(Rectangle(2, 2)));
  Expect.equals("default", testObject3(Circle(1)));
  Expect.equals("default", testObject3(Shape()));
}
