// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A pattern on the left side of an assignment expression is used to
/// destructure the assigned value. We extend expression:
///
/// expression        ::= patternAssignment
///                     | // Existing productions...
///
/// patternAssignment ::= outerPattern '=' expression
///
/// This syntax allows chaining pattern assignments and mixing them with other
/// assignments, but does not allow patterns to the left of a compound
/// assignment operator.
///
/// @description Check an object pattern in a pattern assignment
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  int a1 = 3;
  Square(areaAsInt: a1, sizeAsInt: _) = Square(1);
  Expect.equals(1, a1);

  int a2 = 5, b2 = 6;
  Square(areaAsInt: a2, sizeAsInt: b2) = Square(2);
  Expect.equals(4, a2);
  Expect.equals(2, b2);
}
