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
/// @description Check that it is a compile-time error if pattern variable
/// declaration is used in top-level variables
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";

class Meta {
  const Meta();
}

@Meta()
final ((a1, b1) && r1) = (1, 2);
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

@Meta()
var [a2, b2] = [1, 2];
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final {"key1": a3, "key2": b3} = {"key1": 1, "key2": 2};
//    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

var (a4, b4) = (1, 2);
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final (:num n1, :n2) = (n1: 3.14, n2: "pi");
//    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

var Square(areaAsInt: int a2, sizeAsInt: b2) = Square(1);
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final Square(:int areaAsInt, :sizeAsInt) = Square(1);
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
