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
/// branch is evaluated. Test switch expression
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
  const three = Unit(3, logger);
  const pi = Unit(3.14, logger);

  Shape shape1 = Square(1, logger);
  String s1 = switch (shape1) {
    Square(area: two) || Square(area: one) => log,
    _ => "Other"
  };
  Expect.equals("Square.area:(2==1);(1==1);", s1);
  clearLog();

  Shape shape2 = Shape(logger);
  String s2 = switch (shape2) {
    Square(area: two) || Rectangle(area: one) || Shape(area: zero) => log,
    _ => "Other"
  };
  Expect.equals("Shape.area:(0==0);", s2);
  clearLog();

  Shape shape3 = Circle(1, logger);
  String s3 = switch (shape3) {
    Circle(area: two) || Circle(area: one) || Circle(area: zero)
      || Circle(area: pi) => log,
    _ => "Other"
  };
  Expect.equals("Circle.area:(2==3.14);(1==3.14);(0==3.14);(3.14==3.14);",
    s3);
  clearLog();

  Shape shape4 = Rectangle(1, 2, logger);
  String s4 = switch (shape4) {
    Rectangle(area: three) || Rectangle(area: one) || Rectangle(area: pi)
      => "Wrong!",
    _ => log
  };
  Expect.equals("Rectangle.area:(3==2);(1==2);(3.14==2);", s4);
}
