// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// As with record patterns, the getter name can be omitted and inferred from
/// the variable pattern in the field subpattern which may be wrapped in a unary
/// pattern
///
/// @description Checks an object pattern with omitted getter name and a
/// parenthesized subpattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";
import "../../Utils/expect.dart";

int test1(Shape shape) =>
  switch(shape) {
    Square(:(var areaAsInt)) => areaAsInt,
    _ => -1
  };

int test2(Shape shape) {
  if (shape case Square(:(final areaAsInt))) {
    return areaAsInt;
  }
  return -1;
}

int test3(Shape shape) {
  switch (shape) {
    case Square(:(int areaAsInt)):
      return areaAsInt;
    default:
      return -1;
  }
}

main() {
  var Square(:(int areaAsInt)) = Square(1);
  Expect.equals(1, areaAsInt);

  final Square(:(int sizeAsInt)) = Square(2);
  Expect.equals(2, sizeAsInt);

  var Square(: (double areaAsDouble)) = Square(3);
  Expect.equals(9, areaAsDouble);

  final Square(: (double sizeAsDouble)) = Square(4);
  Expect.equals(4, sizeAsDouble);

  Expect.equals(4, test1(Square(2)));
  Expect.equals(4, test2(Square(2)));
  Expect.equals(4, test3(Square(2)));
}
