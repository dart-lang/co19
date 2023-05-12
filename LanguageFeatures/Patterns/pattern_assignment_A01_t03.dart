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
/// @description Check a map pattern in a pattern assignment
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  var a1 = 42;
  {"key1": a1, "key2": _} = {"key1": 1, "key2": 2};
  Expect.equals(1, a1);

  int a2 = 42, b2 = 42;
  <String, int>{"key1": a2, "key2": b2} = {"key1": 3, "key2": 4};
  Expect.equals(3, a2);
  Expect.equals(4, b2);

  int a3 = 42, b3 = 42;
  {"key1": a3, "key2": b3} = {"key1": 5, "key2": 6, "key3": 7};
  Expect.equals(5, a3);
  Expect.equals(6, b3);
}
