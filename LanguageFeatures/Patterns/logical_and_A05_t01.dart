// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// logicalAndPattern ::= ( logicalAndPattern '&' )? relationalPattern
///
/// A pair of patterns separated by & matches only if both subpatterns match.
/// Unlike logical-or patterns, the variables defined in each branch must not
/// overlap, since the logical-and pattern only matches if both branches do and
/// the variables in both branches will be bound.
///
/// If the left branch does not match, the right branch is not evaluated. This
/// only matters because patterns may invoke user-defined methods with visible
/// side effects.
///
/// @description Checks that if the left branch does not match, the right branch
/// is not evaluated
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";
import "../../Utils/expect.dart";

main() {
  Shape shape1 = Circle(1);
  switch (shape1) {
    case Circle(area: 2) & Circle(area: 3.14):
      Expect.fail("Pattern should not match");
      break;
    default:
  }
  Expect.equals("Circle.area=2;", shape1.log);

  Shape shape2 = Square(1);
  switch (shape2) {
    case Square(area: 1) & Square(area: 2) & Square(area: 1):
      Expect.fail("Pattern should not match");
      break;
    default:
  }
  Expect.equals("Square.area=1;Square.area=2;", shape2.log);

  Shape shape3 = Shape();
  switch (shape3) {
    case Rectangle(area: 0) & Circle(area: 0) & Square(area: 1) & Shape(area: 0):
      Expect.fail("Pattern should not match");
      break;
    default:
  }
  Expect.equals("Shape.area=0;Shape.area=0;Shape.area=1;", shape3.log);
}
