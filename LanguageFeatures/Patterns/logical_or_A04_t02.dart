// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion logicalOrPattern ::= ( logicalOrPattern '|' )? logicalAndPattern
///
/// A pair of patterns separated by | matches if either of the branches match
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
/// branch is evaluated
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";
import "../../Utils/expect.dart";

main() {
  Shape shape1 = Square.withLog(1);
  switch (shape1) {
    case Circle(area: var s) | Square(area: var s):
      Expect.equals("Square.area", shapesLog);
      break;
    default:
      print("Other");
  }

  Shape shape2 = Shape.withLog();
  clearLog();
  switch (shape2) {
    case Square(area: var s) | Rectangle(area: var s) | Shape(area: var s):
      Expect.equals("Shape.area", shapesLog);
      break;
    default:
      print("Other");
  }

  Expect.throws(() {
    Shape shape3 = Point();
    switch (shape3) {
      case Square(area: var s) | Point(area: var s):
        print("Square or Point");
        break;
      default:
        print("Other");
    }
  });
}
