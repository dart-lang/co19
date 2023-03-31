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
/// It is a compile-time error if:
///
/// An identifier in a variable pattern does not resolve to an assignable local
/// variable or formal parameter. A variable is assignable if it is any of:
///
/// - Non-final
/// - Final and definitely unassigned
/// - Late final and not definitely assigned
///
/// @description Check that it is a compile-time error if an identifier in a
/// variable pattern is final but not definitely unassigned
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var a = 42;
  Record r = ();
  final af;
  final rf;
  final lf;
  final areaAsInt;

  if (1 > 2) {
    af = 42;
    rf = ();
    lf = [];
    areaAsInt = 42;
  }

  ((af, _) && r) = (1, 2);
//  ^^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, _) && rf) = (1, 2);
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  [af, _] = [1, 2];
// ^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, ...lf] = [1, 2];
//       ^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": af, "key2": _} = {"key1": 1, "key2": 2};
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": af} = {"key1": 1, "key2": 2};
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

  (af, _)  = (1, 2);
// ^^
// [analyzer] unspecified
// [cfe] unspecified

  (n1: af, _)  = (n1: 1, 2);
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  (:af, _)  = (af: 1, 2);
//  ^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: af) = Square(1);
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:areaAsInt) = Square(1);
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
