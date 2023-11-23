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
/// different unary patterns. Test an if-case statement
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(Shape shape) {
  if (shape case Circle(sizeAsInt: 1, :var areaAsDouble as num)) {
    return "cast = ${areaAsDouble.toStringAsFixed(2)}";
  }
  if (shape case Circle(sizeAsInt: 2, :final areaAsNull as num)) {
    return "cast = ${areaAsNull.toStringAsFixed(2)}";
  }
  if (shape case Circle(sizeAsInt: 3, :var areaAsNullable?)) {
    return "null-check = ${areaAsNullable.toStringAsFixed(2)}";
  }
  if (shape case Circle(sizeAsInt: 4, :final areaAsNull?)) {
    return "null-check = ${areaAsNull.toStringAsFixed(2)}";
  }
  if (shape case Circle(sizeAsInt: 5, :var areaAsNullable!)) {
    return "null-assert = ${areaAsNullable.toStringAsFixed(2)}";
  }
  if (shape case Circle(sizeAsInt: 6, :var areaAsNull!)) {
    return "null-assert = ${areaAsNull.toStringAsFixed(2)}";
  }
  if (shape case Rectangle(sizeAsInt: 1, :int areaAsInt)) {
    return "variable-1 = $areaAsInt";
  }
  if (shape case Rectangle(sizeAsInt: 2, :var areaAsInt)) {
    return "variable-2 = $areaAsInt";
  }
  if (shape case Rectangle(sizeAsInt: 3, :final int areaAsInt)) {
    return "variable-3 = $areaAsInt";
  }
  if (shape case Rectangle(sizeAsInt: 4, :final areaAsInt)) {
    return "variable-4 = $areaAsInt";
  }
  if (shape case Rectangle<Meter>(sizeAsInt: 44, :final areaAsInt)) {
    return "variable-5 = $areaAsInt";
  }
  return "default";
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
}
