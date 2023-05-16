// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// It is a compile-time error if any of the following refutable patterns appear
/// in an irrefutable context:
/// - Logical-or
/// - Relational
/// - Null-check
/// - Constant
///
/// @description Checks that it is a compile-time error if constant pattern
/// appears in irrefutable context
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

class C {
  const C();
}

main() {
  var const C() = const C();
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  final (42) = 42;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  var [x1, 2] = [1, 2];
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": int x2, "key2": 2} = {"key1": 1, "key2": 2};
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

  var (num x3, name: "pi") = (3.14, name: "pi");
//                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (double 3.14, name: String x4) = (3.14, name: "pi");
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(areaAsInt: x5, sizeAsInt: 2) = Square(2);
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
}
