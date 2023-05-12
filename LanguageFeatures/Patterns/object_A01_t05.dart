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
/// @description Checks an object pattern with a cast subpattern in a
/// declaration context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var Square(areaAsNullable: a1 as double) = Square(2);
  Expect.equals(4, a1);

  final Square(areaAsNullable: b1 as double) = Square(2);
  Expect.equals(4, b1);

  var Square(areaAsNullable: num? c1 as double) = Square(2);
  Expect.equals(4, c1);

  Expect.throws(() {
    var Circle(areaAsNullable: d1 as int) = Circle(2);
  });
  Expect.throws(() {
    final Circle(areaAsNullable: e1 as int) = Circle(2);
  });
  Expect.throws(() {
    var Circle(areaAsNullable: num? f1 as int) = Circle(2);
  });

  var Square(areaAsNullable: _ as double) = Square(2);
  final Square(areaAsNullable: _ as double) = Square(2);
  var Square(areaAsNullable: num? _ as double) = Square(2);
  final Square(areaAsNullable: num? _ as double) = Square(2);
  Expect.throws(() {
    var Circle(areaAsNullable: _ as int) = Circle(2);
  });
  Expect.throws(() {
    final Circle(areaAsNullable: _ as int) = Circle(2);
  });
  Expect.throws(() {
    var Circle(areaAsNullable: int _ as int) = Circle(2);
  });
  Expect.throws(() {
    final Circle(areaAsNullable: int _ as int) = Circle(2);
  });
}
