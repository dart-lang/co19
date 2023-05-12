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
/// @description Checks that it is a compile-time error if null-check pattern
/// appears in irrefutable context
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

main() {
  var x1? = 42;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  final (int? x2?) = 42;
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  var [x3?, ...] = [1, 2];
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": int? x4?} = {"key1": 1};
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  var (num? x5?, name: String x6) = (3.14, name: "pi");
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  final (num x7, name: String? x8?) = (3.14, name: "pi");
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(areaAsNullable: x9?) = Square(2);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(:areaAsNullable?) = Square(2);
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}
