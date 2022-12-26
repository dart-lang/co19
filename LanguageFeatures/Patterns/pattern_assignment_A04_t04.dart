// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A pattern on the left side of an assignment expression is used to
/// destructure the assigned value. We extend expression:
///
/// expression        ::= patternAssignment
///                     | // Existing productions...
///
/// patternAssignment ::= outerPattern '=' expression
/// ...
/// In a pattern assignment, all variable patterns are interpreted as referring
/// to existing variables. You can't declare any new variables.
///
/// @description Check that it is a compile-time error if a pattern assignment
/// declares any variable. Test a record pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main() {
  int a = -1, b = -2;
  String name = "name";
  (var a, _) = (1, 2);
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int a, _) = (1, 2);
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (final a, _) = (1, 2);
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, var b1) = (1, 2);
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, int b2) = (1, 2);
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, final b3) = (1, 2);
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: var c) = (3, 4, name: "x");
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: String c) = (3, 4, name: "x");
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: final c) = (3, 4, name: "x");
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: var c1) = (3, 4, name: "x");
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: String c2) = (3, 4, name: "x");
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: final c3) = (3, 4, name: "x");
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (const a, b, name: c) = (3, 4, name: "x");
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, const b4, name: c) = (3, 4, name: "x");
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: const c) = (3, 4, name: "x");
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, b, name: const c4) = (3, 4, name: "x");
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
