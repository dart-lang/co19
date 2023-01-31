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
/// ...
/// The matched value type for a variable or cast pattern is not assignable to
/// the corresponding variable's type.
///
/// @description Check that it is a compile-time error if the matched value type
/// for a variable or cast pattern is not assignable to the corresponding
/// variable's type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  int a = 42;
  (String, int) r1 = ("one", 1);
  ({int n}) r2 = (n: 42);
  List<int> l = [];
  String areaAsInt = "42";
  String s = "";

  ((a, _) && r1) = ("one", 2);
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, _) && r2) = (1, 2);
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, _] = ["one", 2];
// ^
// [analyzer] unspecified
// [cfe] unspecified

  [a, ...l] = [1, "two"];
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, "key2": _} = {"key1": "one", "key2": 2};
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, ...} = {"key1": "one", "key2": 2};
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  (a, _) = ("one", 2);
// ^
// [analyzer] unspecified
// [cfe] unspecified

  (n1: a, _)  = (n1: "one", 2);
//     ^
// [analyzer] unspecified
// [cfe] unspecified

  (:a, _)  = (a: "one", 2);
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  (a, _)  = (n: 2);
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: s) = Square(1);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:areaAsInt) = Square(1);
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: a) = Circle(1);
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
