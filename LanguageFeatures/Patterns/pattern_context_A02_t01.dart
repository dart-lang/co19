// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// It is a compile-time error if a variable pattern in a declaration context is
/// marked with var or final
///
/// @description Checks that it is a compile-time error if a variable pattern in
/// a declaration context is marked with var or final
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var (final x1) = 42;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (var x2) = 42;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var [final x3, ...] = [1, 2];
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": var x4} = {"key1": 1};
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (final num x5, n: String x6) = (3.14, n: "pi");
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (num x7, n: var x8) = (3.14, n: "pi");
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(:var areaAsInt) = Square(2);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(areaAsInt: final int x9) = Square(2);
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
