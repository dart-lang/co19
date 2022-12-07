// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion logicalOrPattern ::= ( logicalOrPattern '||' )? logicalAndPattern
///
/// A pair of patterns separated by || matches if either of the branches match
///
/// A logical-or pattern may match even if one of its branches does not. That
/// means that any variables in the non-matching branch would not be
/// initialized. To avoid problems stemming from that, the following
/// restrictions apply:
///
/// The two branches must define the same set of variables.
///
/// If the left branch matches, the right branch is not evaluated. This
/// determines which value the variable gets if both branches would have
/// matched. In that case, it will always be the value from the left branch.
///
/// @description Checks that if the left branch doesn't match, then the right
/// branch is evaluated. Test switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

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
  const zero = Unit(0, logger);
  const one = Unit(1, logger);
  const two = Unit(2, logger);
  const pi = Unit(3.14, logger);

  Shape shape1 = Square(1, logger);
  switch (shape1) {
    case Square(area: two) || Square(area: one):
      Expect.equals("Square.area=2;=1;", log);
      break;
    default:
      Expect.fail("No match");
  }
  clearLog();

  Shape shape2 = Shape(logger);
  switch (shape2) {
    case Square(area: two) || Rectangle(area: one) || Shape(area: zero):
      Expect.equals("Shape.area=0;", log);
      break;
    default:
      Expect.fail("No match");
  }
  clearLog();

  Shape shape3 = Circle(1, logger);
  switch (shape2) {
    case Circle(area: two) || Circle(area: one) || Circle(area: zero)
        || Circle(area: pi):
      Expect.equals(
          "Circle.area=2;=1;=0;=3.14;", log);
      break;
    default:
      Expect.fail("No match");
  }
  clearLog();

  Shape shape4 = Rectangle(1, 2, logger);
  switch (shape4) {
    case Rectangle(area: three) || Rectangle(area: one) || Rectangle(area: pi):
      Expect.fail("No branches should match");
      break;
    default:
      Expect.equals("Rectangle.area=3;=1;=3.14;", log);
  }
}
