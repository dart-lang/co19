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
/// @description Check a record pattern in a pattern assignment
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

main() {
  var a1 = 3;
  (a1, _) = (1, 2);
  Expect.equals(1, a1);

  num a2 = 2.71;
  String b2 = "e";
  (a2, n: b2) = (3.14, n: "pi");
  Expect.equals(3.14, a2);
  Expect.equals("pi", b2);

  var a3 = "y";
  var b3 = 0;
  (n1: a3, n2: b3) = (n1: "x", n2: 42);
  Expect.equals("x", a3);
  Expect.equals(42, b3);

  var n1 = "y";
  var n2 = 0;
  (:n1, :n2) = (n1: "x", n2: 42);
  Expect.equals("x", n1);
  Expect.equals(42, n2);
}
