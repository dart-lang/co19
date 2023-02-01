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
/// a map pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  bool visited = false;
  for (@Meta() var {"key1": a1, "key2": _} in [{"key1": 1, "key2": 2}]) {
    Expect.equals(1, a1);
    a1 = 42;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var {"key1": int a2, "key2": b2} in [{"key1": 3, "key2": 4}]) {
    Expect.equals(3, a2);
    Expect.equals(4, b2);
    a2 = 42;
    b2 = 42;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (var <String, int>{"key1": int a3, "key2": b3, ...}
      in [{"key1": 5, "key2": 6, "key3": 7}]) {
    Expect.equals(5, a3);
    Expect.equals(6, b3);
    a3 = 42;
    b3 = 42;
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (@Meta() final {"key1": a4, "key2": _} in [{"key1": 1, "key2": 2}]) {
    Expect.equals(1, a4);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for (final {"key1": int a5, "key2": b5} in [{"key1": 3, "key2": 4}]) {
    Expect.equals(3, a5);
    Expect.equals(4, b5);
    visited = true;
  }
  Expect.isTrue(visited);

  visited = false;
  for(final <String, int>{"key1": int a6, "key2": b6, ...}
      in [{"key1": 5, "key2": 6, "key3": 7}]) {
    Expect.equals(5, a6);
    Expect.equals(6, b6);
    visited = true;
  }
  Expect.isTrue(visited);
}
