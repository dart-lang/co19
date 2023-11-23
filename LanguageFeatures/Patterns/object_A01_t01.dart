// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
///
/// An object pattern matches values of a given named type and then extracts
/// values from it by calling getters on the value. Object patterns let users
/// destructure data from arbitrary objects using the getters the object's class
/// already exposes.
///
/// @description Checks an object pattern with different subpatterns in a
/// switch expression
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(Shape shape) {
  return switch (shape) {
    Rectangle(sizeAsInt: 1, areaAsInt: > 3 || 2) => "logical-or",
    Rectangle<Meter>(sizeAsInt: 11, areaAsInt: > 3 || 2) => "logical-or-2",
    Rectangle(sizeAsInt: 2, areaAsInt: > 0 && < 10) => "logical-and",
    Rectangle(sizeAsInt: 3, areaAsInt: > 5) => "relational",
    Circle(sizeAsInt: 1, areaAsDouble: var c1 as num)
        => "cast = ${c1.toStringAsFixed(2)}",
    Circle(sizeAsInt: 10, areaAsNull: final c2 as num)
        => "cast = ${c2.toStringAsFixed(2)}",
    Circle(sizeAsInt: 2, areaAsNullable: var a1?)
        => "null-check = ${a1.toStringAsFixed(2)}",
    Circle(sizeAsInt: 20, areaAsNull: var a2?)
        => "null-check = ${a2.toStringAsFixed(2)}",
    Circle(sizeAsInt: 3, areaAsNullable: var b1!)
        => "null-assert = ${b1.toStringAsFixed(2)}",
    Circle(sizeAsInt: 30, areaAsNull: var b2!)
        => "null-assert = ${b2.toStringAsFixed(2)}",
    Square(sizeAsInt: 1) => "constant",
    Rectangle(sizeAsInt: 41, areaAsInt: int s1) => "variable-1 = $s1",
    Rectangle(sizeAsInt: 42, areaAsInt: var s2) => "variable-2 = $s2",
    Rectangle(sizeAsInt: 43, areaAsInt: final int s3)
        => "variable-3 = $s3",
    Rectangle(sizeAsInt: 44, areaAsInt: final s4) => "variable-4 = $s4",
    Square(sizeAsInt: (2)) => "parenthesized",
    Rectangle(sizeAsInt: 5, areaAsList: [var l1]) => "list = ${l1.toInt()}",
    Rectangle(sizeAsInt: 6, areaAsList: [5]) => "list-2",
    Rectangle(sizeAsInt: 7, areaAsMap: {"area": var m1})
        => "map = ${m1.toInt()}",
    Rectangle(sizeAsInt: 8, areaAsMap: {"area": 3}) => "map-2",
    Rectangle(sizeAsInt: 9, areaAsRecord: (area: var x1))
        => "record = ${x1.toInt()}",
    Rectangle(sizeAsInt: 10, areaAsRecord: (area: 1)) => "record-2",
    Square(size: Unit(value: 3)) => "object-1",
    Square(sizeAsInt: 4, area: Unit(value: var o1))
        => "object-2 = ${o1.toInt()}",
    _ => "default"
  };
}

main() {
  Expect.equals("logical-or", test(Rectangle(1, 4)));
  Expect.equals("logical-or", test(Rectangle(1, 2)));
  Expect.equals("default", test(Rectangle(1, 1)));
  Expect.equals("default", test(Rectangle(11, 4)));
  Expect.equals("default", test(Rectangle<Centimeter>(11, 4)));
  Expect.equals("logical-or-2", test(Rectangle<Meter>(11, 4)));
  Expect.equals("logical-and", test(Rectangle(2, 1)));
  Expect.equals("default", test(Rectangle(2, 5)));
  Expect.equals("relational", test(Rectangle(3, 2)));
  Expect.equals("default", test(Rectangle(3, 1)));
  Expect.equals("cast = 3.14", test(Circle(1)));
  Expect.throws(() {test(Circle(10));});
  Expect.equals("null-check = 12.56", test(Circle(2)));
  Expect.equals("default", test(Circle(20)));
  Expect.equals("null-assert = 28.26", test(Circle(3)));
  Expect.throws(() {test(Circle(30));});
  Expect.equals("constant", test(Square(1)));
  Expect.equals("variable-1 = 41", test(Rectangle(41, 1)));
  Expect.equals("variable-2 = 42", test(Rectangle(42, 1)));
  Expect.equals("variable-3 = 43", test(Rectangle(43, 1)));
  Expect.equals("variable-4 = 44", test(Rectangle(44, 1)));
  Expect.equals("parenthesized", test(Square(2)));
  Expect.equals("default", test(Square(20)));
  Expect.equals("list = 10", test(Rectangle(5, 2)));
  Expect.equals("default", test(Rectangle(6, 1)));
  Expect.equals("map = 7", test(Rectangle(7, 1)));
  Expect.equals("default", test(Rectangle(8, 1)));
  Expect.equals("record = 9", test(Rectangle(9, 1)));
  Expect.equals("default", test(Rectangle(10, 1)));
  Expect.equals("object-1", test(Square(3)));
  Expect.equals("object-2 = 16", test(Square(4)));
  Expect.equals("default", test(Square(5)));
}
