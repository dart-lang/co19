// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// It is a compile-time error if a variable pattern appears in an assignment
/// context.
///
/// @description Checks that it is a compile-time error if a variable pattern
/// appears in an assignment context.
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

main() {
  var a = 0, b = 0, areaAsInt = 0;
  String s = "";

  (var a) = 42;
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (final a) = 42;
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (final int a) = 42;
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int a) = 42;
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [var a, ...] = [1, 2];
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [final a, ...] = [1, 2];
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  [int a, ...] = [1, 2];
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [final int a, ...] = [1, 2];
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": var a} = {"key1": 1};
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": int a} = {"key1": 1};
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": final a} = {"key1": 1};
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": final int a} = {"key1": 1};
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (var a, name: s) = (1, name: "one");
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (final a, name: s) = (1, name: "one");
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (final int a, name: s) = (1, name: "one");
// ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int a, name: s) = (1, name: "one");
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, name: var s) = (1, name: "one");
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, name: final s) = (1, name: "one");
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, name: final String s) = (1, name: "one");
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (a, name: String s) = (1, name: "one");
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: var a) = Square(2);
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: final a) = Square(2);
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: int a) = Square(2);
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: final int a) = Square(2);
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:var areaAsInt) = Square(2);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:final areaAsInt) = Square(2);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:final int areaAsInt) = Square(2);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:int areaAsInt) = Square(2);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
