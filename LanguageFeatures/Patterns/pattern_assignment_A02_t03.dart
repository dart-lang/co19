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
/// @description Check that pattern assignments may be chained. Test that
/// chaining an object pattern doesn't create an excessive instances
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

var cCounter = 0;
String log = "";

class C {
  int _x;
  final int counter = cCounter++;
  C({required int x}) : _x = x + 1;
  int get x => _x++;
}

void main() {
  var y = 0;
  var z = C(x: y) = C(x: y) = C(x: y) = C(x: y);
  Expect.equals(1, cCounter);
  Expect.equals(3, y);
  Expect.equals(0, z.counter);
  Expect.equals(4, z.x);
}
