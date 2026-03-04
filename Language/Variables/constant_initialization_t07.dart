// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant variable must be initialized to a compile-time 
/// constant or a compile-time error occurs.
///
/// @description Checks that it is a compile error if a static constant variable
/// is not initialized in its declaration.
/// @author sgrekhov22@gmail.com

class C {
  static const v1;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int v2;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int? v3;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Null v4;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const void v5;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Object? v6;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const dynamic v7;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Never v8;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static const v1;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int v2;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int? v3;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Null v4;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const void v5;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Object? v6;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const dynamic v7;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Never v8;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static const v1;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int v2;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int? v3;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Null v4;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const void v5;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Object? v6;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const dynamic v7;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Never v8;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static const v1;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int v2;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int? v3;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Null v4;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const void v5;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Object? v6;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const dynamic v7;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Never v8;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static const v1;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int v2;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const int? v3;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Null v4;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const void v5;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const Object? v6;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static const dynamic v7;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  static final Never v8;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
