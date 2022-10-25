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
/// @description Checks that if both branches matches then value from the left
/// branch is taken
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class Shape {
  int counter = 0;
  double get area => counter++;
}

main() {
  Shape shape = Shape();
  switch (shape) {
    case Shape(area: var s) | Shape(area: var s) | Shape(area: var s):
      Expect.equals(0, s);
      break;
    default:
      print("Other");
  }
}
