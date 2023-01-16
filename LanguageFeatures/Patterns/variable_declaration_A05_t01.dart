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
/// @description Check that it is a compile-time error if the type of expression
/// in a pattern-for-in loop is not assignable to Iterable<dynamic>.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

class Meta {
  const Meta();
}

main() {
  for (@Meta() final ((a1, b1) && r1) in (1, 2)) {
//                                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (@Meta() final {"key1": a3, "key2": b3} in {"key1": 1, "key2": 2}) {
//                                               ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (@Meta() var (a4, b4) in (1, 2)) {
//                             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final (:num n1, :n2) in (n1: 3.14, n2: "pi")) {
//                             ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (@Meta() var Square(areaAsInt: int a5, sizeAsInt: b5) in Square(1)) {
//                                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final Square(:int areaAsInt, :sizeAsInt) in Square(1)) {
//                                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
