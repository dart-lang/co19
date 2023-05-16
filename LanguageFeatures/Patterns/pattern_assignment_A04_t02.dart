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
/// declares any variable. Test a list pattern
/// @author sgrekhov22@gmail.com

main() {
  int a = -1, b = -2;
  var c = [0];
  [var a, _] = [1, 2];
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [int a, _] = [1, 2];
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [final a, _] = [1, 2];
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, var b1] = [1, 2];
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, int b2] = [1, 2];
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, final b3] = [1, 2];
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, b, ... var c] = [3, 4, 5, 6];
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, b, ... List<int> c] = [3, 4, 5, 6];
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, b, ... final c] = [3, 4, 5, 6];
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, b, ... var c1] = [3, 4, 5, 6];
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, b, ... List<int> c2] = [3, 4, 5, 6];
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, b, ... final c3] = [3, 4, 5, 6];
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [const a, b, ... c] = [3, 4, 5, 6];
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, const b4, ...c] = [3, 4, 5, 6];
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, b, ... const c4] = [3, 4, 5, 6];
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
