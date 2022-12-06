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
/// branch is evaluated. Test if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";
import "../../Utils/expect.dart";

main() {
  Shape shape1 = Square(1);
  if (shape1 case Square(area: 2) || Square(area: 1)) {
    Expect.equals("Square.area=2;=1;", shape1.log);
  } else {
    Expect.fail("Expression should match");
  }

  Shape shape2 = Shape();
  if (shape2 case Square(area: 2) || Rectangle(area: 1) || Shape(area: 0)) {
    Expect.equals("Shape.area=0;", shape2.log);
  } else {
    Expect.fail("Expression should match");
  }

  Shape shape3 = Circle(1);
  if (shape2 case Circle(area: 2) || Circle(area: 1) || Circle(area: 0)
      || Circle(area: 3.14)) {
    Expect.equals(
      "Circle.area=2;=1;=0;=3.14;",
      shape3.log);
  } else {
    Expect.fail("Expression should match");
  }

  Shape shape4 = Rectangle(1, 2);
  if (shape4 case Rectangle(area: 3) || Rectangle(area: 1)
      || Rectangle(area: 42)) {
    Expect.fail("No branches should match");
  } else {
    Expect.equals("Rectangle.area=3;=1;=42;", shape4.log);
  }
}
