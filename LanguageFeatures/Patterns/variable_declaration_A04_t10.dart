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
/// assigned in a for-in loop. Test an object pattern
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

class Meta {
  const Meta();
}

main() {
  for (@Meta() final Square(areaAsInt: int a1, sizeAsInt: b1) in [Square(1)]) {
  a1 = 3;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  b1 = 4;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  for (final Square(:int areaAsInt, :sizeAsInt) in [Square(1)]) {
    areaAsInt = 2;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    sizeAsInt = 42;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
