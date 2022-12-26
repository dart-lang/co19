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
/// declares any variable. Test a parenthesized pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

main() {
  Record r = ();
  int a = 42, b = 42;
  ((var a, _) && r) = (1, 2);
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((int a, _) && r) = (1, 2);
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((final a, _) && r) = (1, 2);
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, var x) && r) = (1, 2);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, int x) && r) = (1, 2);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, final x3) && r) = (1, 2);
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, b) && var r) = (1, 2);
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, b) && Record r) = (1, 2);
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, b) && final r) = (1, 2);
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, b) && var r1) = (1, 2);
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, b) && Record r1) = (1, 2);
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, b) && final r1) = (1, 2);
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((const a, _) && r) = (1, 2);
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, const c1) && r) = (1, 2);
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, b) && const r) = (1, 2);
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
