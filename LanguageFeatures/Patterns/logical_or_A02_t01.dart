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
/// @description Checks logical-or pattern in a switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";
import "../../Utils/expect.dart";

void test(Shape shape, Unit expectedArea, Type expectedType, bool match) {
  switch (shape) {
    case Square(area: var s) || Circle(area: var s):
      Expect.equals(s, expectedArea);
      Expect.equals(expectedType, shape.runtimeType);
      Expect.isTrue(match);
      break;
    default:
      Expect.equals(s, expectedArea);
      Expect.equals(expectedType, shape.runtimeType);
      Expect.isFalse(match);
  }
}

main() {
  test(Circle(1), Unit(3.14), Circle, true);
  test(Square(2), Unit(4), Square, true);
  test(Rectangle(2, 1), Unit(2), Rectangle, false);
}
