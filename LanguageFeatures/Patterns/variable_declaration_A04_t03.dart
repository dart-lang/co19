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
/// a list pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  bool visited = false;
  for (@Meta() var [a1, _] in [[1, 2]]) {
    Expect.equals(1, a1);
    a1 = 3;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for([int a2, b2, ...List<int> c2] in [[3, 4, 5, 6]]) {
    Expect.equals(3, a2);
    Expect.equals(4, b2);
    Expect.listEquals([5, 6], c2);
    a2 = 5;
    b2 = 6;
    c2 = [];
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var <int>[a3, b3, ...c3] in [[5, 6, 7, 8]]) {
    Expect.equals(5, a3);
    Expect.equals(6, b3);
    Expect.listEquals([7, 8], c3);
    a3 = 7;
    b3 = 8;
    c3 = [];
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (@Meta() final [_, b4] in [[1, 2]]) {
    Expect.equals(2, b4);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final [int a5, b5, ...List<int> c5] in [[3, 4, 5, 6]]) {
    Expect.equals(3, a5);
    Expect.equals(4, b5);
    Expect.listEquals([5, 6], c5);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final <int>[a6, b6, ...c6] in [[5, 6, 7, 8]]) {
    Expect.equals(5, a6);
    Expect.equals(6, b6);
    Expect.listEquals([7, 8], c6);
  }
  Expect.isTrue(visited);
}
