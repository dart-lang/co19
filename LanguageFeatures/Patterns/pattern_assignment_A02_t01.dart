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
/// @description Check that pattern assignments may be chained
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  int a1 = 42;
  dynamic r1 = ();
  var x1 = ((a1, _) && r1) = (1, 2);
  Expect.equals(1, a1);
  Expect.equals(1, r1.$0);
  Expect.equals(2, r1.$1);
  Expect.equals(1, x1.$0);
  Expect.equals(2, x1.$1);

  int a2 = 3;
  final x2 = [a2, _] = [1, 2];
  Expect.equals(1, a1);
  Expect.listEquals(x2, [1, 2]);

  var a3 = 42;
  var x3 = {"key1": a3, "key2": _} = {"key1": 1, "key2": 2};
  Expect.equals(1, a3);
  Expect.mapEquals({"key1": 1, "key2": 2}, x3);

  var a4 = 3;
  final x4 = (a4, _) = (1, 2);
  Expect.equals(1, a4);
  Expect.equals(1, x4.$0);
  Expect.equals(2, x4.$1);

  int a5 = 3;
  var x5 = Square(areaAsInt: a5, sizeAsInt: _) = Square(1);
  Expect.equals(1, a5);
  Expect.isTrue(x5 is Square);
  Expect.equals(1, x5.sizeAsInt);
}
