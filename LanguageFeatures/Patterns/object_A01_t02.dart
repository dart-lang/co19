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
/// switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(Shape shape) {
  switch (shape) {
    case Rectangle(sizeAsInt: 1, areaAsInt: > 3 || 2):
      return "logical-or";
    case Rectangle<Meter>(sizeAsInt: 11, areaAsInt: > 3 || 2):
      return "logical-or-2";
    case Rectangle(sizeAsInt: 2, areaAsInt: > 0 && < 10):
      return "logical-and";
    case Rectangle(sizeAsInt: 3, areaAsInt: > 5):
      return "relational";
    case Circle(sizeAsInt: 1, areaAsDouble: var c1 as num):
      return "cast = ${c1.toStringAsFixed(2)}";
    case Circle(sizeAsInt: 10, areaAsNull: final c2 as num):
      return "cast = ${c2.toStringAsFixed(2)}";
    case Circle(sizeAsInt: 2, areaAsNullable: var a1?):
      return "null-check = ${a1.toStringAsFixed(2)}";
    case Circle(sizeAsInt: 20, areaAsNull: var a2?):
      return "null-check = ${a2.toStringAsFixed(2)}";
    case Circle(sizeAsInt: 3, areaAsNullable: var b1!):
      return "null-assert = ${b1.toStringAsFixed(2)}";
    case Circle(sizeAsInt: 30, areaAsNull: var b2!):
      return "null-assert = ${b2.toStringAsFixed(2)}";
    case Square(sizeAsInt: 1):
      return "constant";
    case Rectangle(sizeAsInt: 41, areaAsInt: int s1):
      return "variable-1 = $s1";
    case Rectangle(sizeAsInt: 42, areaAsInt: var s2):
      return "variable-2 = $s2";
    case Rectangle(sizeAsInt: 43, areaAsInt: final int s3):
      return "variable-3 = $s3";
    case Rectangle(sizeAsInt: 44, areaAsInt: final s4):
      return "variable-4 = $s4";
    case Square(sizeAsInt: (2)):
      return "parenthesized";
    case Rectangle(sizeAsInt: 5, areaAsList: [var l1]):
      return "list = ${l1.toInt()}";
    case Rectangle(sizeAsInt: 6, areaAsList: [5]):
      return "list-2";
    case Rectangle(sizeAsInt: 7, areaAsMap: {"area": var m1}):
      return "map = ${m1.toInt()}";
    case Rectangle(sizeAsInt: 8, areaAsMap: {"area": 3}):
      return "map-2";
    case Rectangle(sizeAsInt: 9, areaAsRecord: (area: var x1)):
      return "record = ${x1.toInt()}";
    case Rectangle(sizeAsInt: 10, areaAsRecord: (area: 1)):
      return "record-2";
    case Square(size: Unit(value: 3)):
      return "object-1";
    case Square(sizeAsInt: 4, area: Unit(value: var o1)):
      return "object-2 = $o1";
    default:
      return "default";
  }
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
  Expect.equals("null-assert = 42", test(Circle(3)));
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
