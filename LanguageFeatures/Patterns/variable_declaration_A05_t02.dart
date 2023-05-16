// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// in a pattern-for-in loop is not assignable to pattern's required type
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

class Meta {
  const Meta();
}

main() {
  for (@Meta() var <int>[a2, b2] in ["1", "2"]) {
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
