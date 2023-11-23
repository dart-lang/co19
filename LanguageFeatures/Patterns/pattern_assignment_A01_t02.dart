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
/// @description Check a list pattern in a pattern assignment
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  int a1 = 3;
  [a1, _] = [1, 2];
  Expect.equals(1, a1);

  int a2 = 5, b2 = 6;
  List<int> c2 = [];
  [a2, b2, ...c2] = [3, 4, 5, 6];
  Expect.equals(3, a2);
  Expect.equals(4, b2);
  Expect.listEquals([5, 6], c2);

  int a3 = 7, b3 = 8;
  var c3 = [];
  <int>[a3, b3, ...c3] = [5, 6, 7, 8];
  Expect.equals(5, a3);
  Expect.equals(6, b3);
  Expect.listEquals([7, 8], c3);
}
