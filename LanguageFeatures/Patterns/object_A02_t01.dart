// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// As with record patterns, the getter name can be omitted and inferred from
/// the variable pattern in the field subpattern which may be wrapped in a unary
/// pattern
///
/// @description Checks an object pattern with omitted getter name wrapped in a
/// different unary patterns. Test a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(Shape shape) {
  return switch (shape) {
    Circle(sizeAsInt: 1, :var areaAsDouble as num)
        => "cast = ${areaAsDouble.toStringAsFixed(2)}",
    Circle(sizeAsInt: 2, :final areaAsNull as num)
        => "cast = ${areaAsNull.toStringAsFixed(2)}",
    Circle(sizeAsInt: 3, :var areaAsNullable?)
        => "null-check = ${areaAsNullable.toStringAsFixed(2)}",
    Circle(sizeAsInt: 4, :final areaAsNull?)
        => "null-check = ${areaAsNull.toStringAsFixed(2)}",
    Circle(sizeAsInt: 5, :var areaAsNullable!)
        => "null-assert = ${areaAsNullable.toStringAsFixed(2)}",
    Circle(sizeAsInt: 6, :var areaAsNull!)
        => "null-assert = ${areaAsNull.toStringAsFixed(2)}",
    Rectangle(sizeAsInt: 1, :int areaAsInt) => "variable-1 = $areaAsInt",
    Rectangle(sizeAsInt: 2, :var areaAsInt) => "variable-2 = $areaAsInt",
    Rectangle(sizeAsInt: 3, :final int areaAsInt) => "variable-3 = $areaAsInt",
    Rectangle(sizeAsInt: 4, :final areaAsInt) => "variable-4 = $areaAsInt",
    Rectangle<Meter>(sizeAsInt: 44, :final areaAsInt)
        => "variable-5 = $areaAsInt",
    Rectangle(sizeAsInt: 5, :(int areaAsInt)) => "parenthesized-1 = $areaAsInt",
    Rectangle(sizeAsInt: 6, :(var areaAsInt as num))
        => "parenthesized-2 = $areaAsInt",
    Rectangle(sizeAsInt: 7, :(final int areaAsInt?))
        => "parenthesized-3 = $areaAsInt",
    Rectangle(sizeAsInt: 8, :(final areaAsInt!))
        => "parenthesized-4 = $areaAsInt",
    _ => "default"
  };
}

main() {
  Expect.equals("cast = 3.14", test(Circle(1)));
  Expect.throws(() {test(Circle(2));});
  Expect.equals("null-check = 28.26", test(Circle(3)));
  Expect.equals("default", test(Circle(4)));
  Expect.equals("null-assert = 78.50", test(Circle(5)));
  Expect.throws(() {test(Circle(6));});
  Expect.equals("variable-1 = 1", test(Rectangle(1, 1)));
  Expect.equals("variable-2 = 2", test(Rectangle(2, 1)));
  Expect.equals("variable-3 = 3", test(Rectangle(3, 1)));
  Expect.equals("variable-4 = 4", test(Rectangle(4, 1)));
  Expect.equals("variable-5 = 44", test(Rectangle<Meter>(44, 1)));
  Expect.equals("default", test(Rectangle<Centimeter>(44, 1)));
  Expect.equals("default", test(Rectangle(44, 1)));
  Expect.equals("parenthesized-1 = 5", test(Rectangle(5, 1)));
  Expect.equals("parenthesized-2 = 6", test(Rectangle(6, 1)));
  Expect.equals("parenthesized-3 = 7", test(Rectangle(7, 1)));
  Expect.equals("parenthesized-4 = 8", test(Rectangle(8, 1)));
}
