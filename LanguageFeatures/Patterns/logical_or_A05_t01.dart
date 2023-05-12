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
/// @description Checks that if the left branch matches, the right branch is not
/// evaluated. Test switch statement
/// @author sgrekhov22@gmail.com

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
  Shape shape1 = Square(1, logger);
  switch (shape1) {
    case Square(area: var s) || Shape(area: var s):
      Expect.equals("Square.area:", log);
      break;
    default:
      Expect.fail("No match");
  }
  clearLog();

  Shape shape2 = Square(2, logger);
  const two = Unit(2, logger);
  const four = Unit(4, logger);
  const eight = Unit(8, logger);
  switch (shape2) {
    case Square(area: two) || Square(area: four) || Square(area: eight):
      Expect.equals("Square.area:(2==4);(4==4);", log);
      break;
    default:
      Expect.fail("No match");
  }
  clearLog();

  Shape shape3 = Shape(logger);
  const zero = Unit(0, logger);
  const one = Unit(1, logger);
  switch (shape3) {
    case Circle(area: zero) || Square(area: one) || Shape(area: zero):
      Expect.equals("Shape.area:(0==0);", log);
      break;
    default:
      Expect.fail("No match");
  }
}
