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
/// a parenthesized pattern
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  bool visited = false;
  for (@Meta() var ((a1, _) && r1) in [(1, 2)]) {
    Expect.equals(1, a1);
    Expect.equals(1, r1.$1);
    Expect.equals(2, r1.$2);
    a1 = 3;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for(var ((num a2, n: String b2) && (num, {String n}) r2) in
      [(3.14, n: "pi")]) {
    Expect.equals(3.14, a2);
    Expect.equals("pi", b2);
    Expect.equals(3.14, r2.$1);
    Expect.equals("pi", r2.n);
    a2 = 2.71;
    b2 = "e";
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (@Meta() final ((a3, _) && r3) in [(1, 2)]) {
    Expect.equals(1, a3);
    Expect.equals(1, r3.$1);
    Expect.equals(2, r3.$2);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for(var ((num a2, n: String b2) && (num, {String n}) r2) in
      [(3.14, n: "pi")]) {
    Expect.equals(3.14, a2);
    Expect.equals("pi", b2);
    Expect.equals(3.14, r2.$1);
    Expect.equals("pi", r2.n);
    visited = true;
  }
  Expect.isTrue(visited);
}
