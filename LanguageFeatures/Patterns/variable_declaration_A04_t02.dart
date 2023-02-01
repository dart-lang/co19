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
/// assigned in a for-in loop. Test a parenthesized pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

class Meta {
  const Meta();
}

main() {
  for (@Meta() final ((a1, b1) && r1) in [(1, 2)]) {
    a1 = 3;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    b1 = 4;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    r1 = (3, 4);
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final ((num a2, n: String b2) && (num, {String n}) r2)
      in [(3.14, n: "pi")]) {
    a2 = 2.71;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    b2 = "e";
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    r2 = (2.71, n: "e");
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
