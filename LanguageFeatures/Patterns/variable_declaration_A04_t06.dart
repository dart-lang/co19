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
/// @description Check that it is a compile-time error if a final variable is
/// assigned in a for-in loop. Test a map pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class Meta {
  const Meta();
}

main() {
  for (@Meta() final {"key1": a1, "key2": b1} in [{"key1": 1, "key2": 2}]) {
    a1 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    b1 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final {"key1": int a2, "key2": b2, ...}
      in [{"key1": 1, "key2": 2, "key3": 3}]) {
    a2 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    b2 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final <String, int>{"key1": a3, "key2": int b3, ...}
      in [{"key1": 1, "key2": 2, "key3": 3}]) {
    a3 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    b3 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
