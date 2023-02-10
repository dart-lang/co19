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
/// @description Checks that it is a compile-time error if relational pattern
/// appears in irrefutable context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var x1 == 0 = 42;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  final int x2 > 0 = 42;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  var [x3 == 1, ...]= [1, 2];
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": int x4 < 0} = {"key1": -1};
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  var (num x5 > 0, n: String x6) = (3.14, n: "pi");
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  final (num x7, n: String x8 == "pi") = (3.14, n: "pi");
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(:areaAsInt > 0) = Square(2);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  var (x8 == 0) = 42;
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  final (int x9 > 0) = 42;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}
