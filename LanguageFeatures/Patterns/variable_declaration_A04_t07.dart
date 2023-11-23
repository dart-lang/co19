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
/// a record pattern
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  bool visited = false;
  for (@Meta() var (a1, _) in [(1, 2)]) {
    Expect.equals(1, a1);
    a1 = 3;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var (num a2, n: String b2) in [(3.14, n: "pi")]) {
    Expect.equals(3.14, a2);
    Expect.equals("pi", b2);
    a2 = 2.71;
    b2 = "e";
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var (n1: String a3, n2: int b3) in [(n1: "x", n2: 42)]) {
    Expect.equals("x", a3);
    Expect.equals(42, b3);
    a3 = "y";
    b3 = 0;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var (:String n1, :n2) in [(n1: "x", n2: 42)]) {
    Expect.equals("x", n1);
    Expect.equals(42, n2);
    n1 = "y";
    n2 = 0;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (@Meta() final (_, a4, _) in [(0, 1, 2)]) {
    Expect.equals(1, a4);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final (num a5, n: String b5) in [(3.14, n: "pi")]) {
    Expect.equals(3.14, a5);
    Expect.equals("pi", b5);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final (n1: String a6, n2: int b6) in [(n1: "x", n2: 42)]) {
    Expect.equals("x", a6);
    Expect.equals(42, b6);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final (:String n3, :n4) in [(n3: "x", n4: 42)]) {
    Expect.equals("x", n3);
    Expect.equals(42, n4);
    visited = true;
  }
  Expect.isTrue(visited);
}
