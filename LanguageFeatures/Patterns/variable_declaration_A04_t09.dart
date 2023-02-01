// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The new rules are incorporated into the existing productions for
/// declaring variables like so:
///
/// localVariableDeclaration ::=
///   | metadata initializedVariableDeclaration ';' // Existing.
///   | metadata patternVariableDeclaration ';' // New.
///
/// forLoopParts ::=
///   | // Existing productions...
///   | metadata ( 'final' | 'var' ) outerPattern 'in' expression // New.
/// As with regular for-in loops, it is a compile-time error if the type of
/// expression in a pattern-for-in loop is not assignable to Iterable<dynamic>.
///
/// @description Check valid variable declaration pattern in a for-in loop. Test
/// an object pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class Meta {
  const Meta();
}

main() {
  bool visited = false;
  for (@Meta() var Square(areaAsInt: int a1, sizeAsInt: _) in [Square(1)]) {
    Expect.equals(1, a1);
    a1 = 3;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var Square(areaAsInt: a2, sizeAsInt: int b2) in [Square(2)]) {
    Expect.equals(4, a2);
    Expect.equals(2, b2);
    a2 = 5;
    b2 = 6;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var Square(:areaAsInt,: int sizeAsInt) in [Square(3)]) {
    Expect.equals(9, areaAsInt);
    Expect.equals(3, sizeAsInt);
    areaAsInt = 5;
    sizeAsInt = 6;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (@Meta() final Square(areaAsInt: int a3, sizeAsInt: _) in [Square(1)]) {
    Expect.equals(1, a3);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final Square(areaAsInt: a4, sizeAsInt: int b4) in [Square(2)]) {
    Expect.equals(4, a4);
    Expect.equals(2, b4);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final Square(:areaAsDouble,: double sizeAsDouble) in [Square(3)]) {
    Expect.equals(9, areaAsDouble);
    Expect.equals(3, sizeAsDouble);
    visited = true;
  }
  Expect.isTrue(visited);
}
