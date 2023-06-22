// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let m and m′ be member signatures with the same name id. Then m
/// is a correct override of m′ iff the following criteria are all satisfied:
/// ...
/// • If m and m′ are both methods or both setters: Let F be the function type
/// of m except that the parameter type is the built-in class Object for each
/// parameter of m which is covariant-by-declaration. Let F′ be the function
/// type of m′. F must then be a subtype of F′.
///
/// @description Checks that it is a compile-time error if `m` and `m′` are both
/// methods and function type `m` is not a subtype of `m′`. Test `implements`
/// clause
/// @author sgrekhov22@gmail.com

interface class I1 {
  void m1(int v1) {}
  void m2(int v1) {}
}

interface class I2 {
  void m1(int v1, [num v2 = 0]) {}
}

interface class I3 {
  void m2(int v1, {String s = ""}) {}
}

class C1 implements I1, I2, I3 {
  void m1() {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2() {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 implements I1, I2, I3 {
  void m1(int v1, [int v2 = 1]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2(int v1, {String s0 = ""}) {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 implements I1, I2, I3 {
  void m1(int v1, {required num v2}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2(int v1, {required String s}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1 implements I1, I2, I3 {
  void m1() {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  void m2() {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 implements I1, I2, I3 {
  void m1(int v1, [int v2 = 1]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2(int v1, {String s0 = ""}) {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3 implements I1, I2, I3 {
  void m1(int v1, {required int v2}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2(int v1, {required String s}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(M1);
  print(M2);
  print(M3);
}
