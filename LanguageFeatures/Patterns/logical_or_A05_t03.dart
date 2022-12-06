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
/// evaluated. Test if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";
import "../../Utils/expect.dart";

main() {
  Shape shape1 = Square(1);
  if (shape1 case Square(area: var s) || Shape(area: var s)) {
    Expect.equals("Square.area", shape1.log);
  } else {
    Expect.fail("Expression should match");
  }

  Shape shape2 = Square(2);
  if (shape2 case Square(area: 2) || Square(area: 4) || Square(area: 4)) {
    Expect.equals("Square.area=2;=4;", shape2.log);
  } else {
    Expect.fail("Expression should match");
  }

  Shape shape3 = Shape();
  if (shape3 case Circle(area: 0) || Square(area: 1) || Shape(area: 0)) {
    Expect.equals("Shape.area=0;", shape3.log);
  } else {
    Expect.fail("Expression should match");
  }
}
