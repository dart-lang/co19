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
/// evaluated. Test switch expression
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
  const zero = Unit(0, logger);
  const one = Unit(1, logger);
  const two = Unit(2, logger);
  const four = Unit(4, logger);

  Shape shape1 = Square(1, logger);
  String s1 = switch (shape1) {
    Square(area: var s) || Shape(area: var s) => log
  };
  Expect.equals("Square.area:", s1);
  clearLog();

  Shape shape2 = Square(2, logger);
  String s2 = switch (shape2) {
    Square(area: two) || Square(area: four) || Square(size: four) => log,
    _ => "Other"
  };
  Expect.equals("Square.area:(2==4);(4==4);", s2);
  clearLog();

  Shape shape3 = Shape(logger);
  String s3 = switch (shape3) {
    Circle(area: zero) || Square(area: one) || Shape(area: zero) => log,
    _ => "Other"
  };
  Expect.equals("Shape.area:(0==0);", s3);
}
