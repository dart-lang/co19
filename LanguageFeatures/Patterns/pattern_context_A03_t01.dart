// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// It is a compile-time error if a variable pattern in a declaration context is
/// marked with var or final
///
/// @description Checks that it is a compile-time error if a variable pattern in
/// an declaration context is marked with var, final
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var (var v1) = 42;
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (final v2) = 42;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (final int v3) = 42;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (var v4) = 42;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (final v5) = 42;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (final int v6) = 42;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var [var v7, ...] = [1, 2];
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final [var v8, ...] = [1, 2];
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var [final v9, ...] = [1, 2];
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final [final v10, ...] = [1, 2];
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var [final int v11, ...] = [1, 2];
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final [final int v12, ...] = [1, 2];
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var {"key1": var v13} = {"key1": 1};
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": var v14} = {"key1": 1};
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var {"key1": final v15} = {"key1": 1};
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": final v16} = {"key1": 1};
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var {"key1": final int v17} = {"key1": 1};
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": final int v18} = {"key1": 1};
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (var v19, name: s1) = (1, name: "one");
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (var v20, name: s2) = (1, name: "one");
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (final v21, name: s3) = (1, name: "one");
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (final v22, name: s4) = (1, name: "one");
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (final int v23, name: s5) = (1, name: "one");
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (final int v24, name: s6) = (1, name: "one");
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (a1, name: var v25) = (1, name: "one");
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (a2, name: var v26) = (1, name: "one");
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (a3, name: final v27) = (1, name: "one");
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (a4, name: final v28) = (1, name: "one");
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (a5, name: final String v29) = (1, name: "one");
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (a6, name: final String v30) = (1, name: "one");
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(areaAsInt: var v31) = Square(2);
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(areaAsInt: var v32) = Square(2);
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(areaAsInt: final v33) = Square(2);
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(areaAsInt: final v34) = Square(2);
//                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var Square(areaAsInt: final int v35) = Square(2);
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(areaAsInt: final int v36) = Square(2);
//                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  {
    var Square(:var areaAsInt) = Square(2);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  {
    final  Square(:var areaAsInt) = Square(2);
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  {
    var Square(:final areaAsInt) = Square(2);
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  {
    final Square(:final areaAsInt) = Square(2);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  {
    var Square(:final int areaAsInt) = Square(2);
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  {
    final Square(:final int areaAsInt) = Square(2);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
