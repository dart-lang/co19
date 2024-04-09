// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Check that pattern assignments may be chained. Test record
/// pattern
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

void main() {
  var y = 0;
  var z1 = (y,) = (y,) = (y,) = (1,);
  Expect.equals(1, y);
  Expect.equals((1,), z1);

  var z2 = (y: y) = (y: y) = (y: y);
  Expect.equals(1, y);
  Expect.equals((y: 1), z2);
}
