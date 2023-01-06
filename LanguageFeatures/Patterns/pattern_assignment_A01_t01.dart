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
/// @description Check a parenthesized pattern in a pattern assignment
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

main() {
  int a1 = 42;
  dynamic r = ();
  ((a1, _) && r) = (1, 2);
  Expect.equals(1, a1);
  Expect.equals(1, r.$0);
  Expect.equals(2, r.$1);

  var a2 = 2.71;
  var b2 = "e";
  ((a2, n: b2) && r) = (3.14, n: "pi");
  Expect.equals(3.14, a2);
  Expect.equals("pi", b2);
  Expect.equals(3.14, r.$0);
  Expect.equals("pi", r.n);
}
