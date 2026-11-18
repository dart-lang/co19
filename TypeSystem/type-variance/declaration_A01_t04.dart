// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared in the type parameter list of a declaration
/// of an extension, a generic function or method, or a type alias; or in the
/// type parameter list of a generic function type.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared by a generic method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

class C {
  static void s1<in T>(T t) {}
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s2<out T>(T t) {}
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s3<inout T>(T t) {}
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m1<in T>(T t) {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2<out T>(T t) {}
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3<inout T>(T t) {}
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void s1<in T>(T t) {}
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s2<out T>(T t) {}
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s3<inout T>(T t) {}
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m1<in T>(T t) {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2<out T>(T t) {}
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3<inout T>(T t);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  static void s1<in T>(T t) {}
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s2<out T>(T t) {}
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s3<inout T>(T t) {}
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m1<in T>(T t) {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2<out T>(T t) {}
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3<inout T>(T t) {}
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void s1<in T>(T t) {}
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s2<out T>(T t) {}
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s3<inout T>(T t) {}
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m1<in T>(T t) {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2<out T>(T t) {}
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3<inout T>(T t) {}
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void s1<in T>(T t) {}
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s2<out T>(T t) {}
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s3<inout T>(T t) {}
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m1<in T>(T t) {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2<out T>(T t) {}
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3<inout T>(T t) {}
//        ^^^^^
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
