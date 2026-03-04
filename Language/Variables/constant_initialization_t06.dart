// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant variable must be initialized to a compile-time 
/// constant or a compile-time error occurs.
///
/// @description Checks that it is a compile error if a constant library
/// variable is not initialized in its declaration.
/// @author sgrekhov22@gmail.com

const int v1;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

const int? v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

const v3;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

const Null v4;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

const void v5;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

const Object? v6;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

const dynamic v7;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

const Never v8;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(v1);
  print(v2);
  print(v3);
  print(v4);
  print(v6);
  print(v7);
  print(v8);
}
