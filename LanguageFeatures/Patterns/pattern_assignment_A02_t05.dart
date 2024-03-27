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
/// @description Check that pattern assignments may be chained. Test list
/// pattern
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

void main() {
  var x, y;
  var z = [x, y] = [y, x] = [x, y,] = [1, 2];
  Expect.equals(1, x);
  Expect.equals(2, y);
  Expect.listEquals([1, 2], z);
}
