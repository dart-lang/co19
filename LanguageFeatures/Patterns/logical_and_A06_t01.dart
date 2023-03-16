// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// logicalAndPattern ::= ( logicalAndPattern '&&' )? relationalPattern
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

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";
import "../../Utils/expect.dart";

String log = "";

void logger(String toLog) {
  log += toLog;
}

void clearLog() {
  log = "";
}

main() {
  const shape1 = Circle(1, logger);
  const one = Unit(1, logger);
  const two = Unit(2, logger);
  const three = Unit(3, logger);

  switch (shape1) {
    case Circle(area: two) && Circle(size: one):
      Expect.fail("Pattern should not match");
      break;
    default:
  }
  Expect.equals("Circle.area:(2==3.14);", log);
  clearLog();

  Shape shape2 = Square(1, logger);
  switch (shape2) {
    case Square(area: one) && Square(area: two) && Square(size: one):
      Expect.fail("Pattern should not match");
      break;
    default:
  }
  Expect.equals("Square.area:(1==1);(2==1);", log);
  clearLog();

  Shape shape3 = Square(1, logger);
  switch (shape3) {
    case Shape(area: one) && Shape(size: one) && Square(area: two)
          && Square(size: three):
      Expect.fail("Pattern should not match");
      break;
    default:
  }
  Expect.equals("Square.area:(1==1);Square.size:(1==1);(2==1);", log);
}
