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
/// methods and function type `m` is not a subtype of `m′.
/// @author sgrekhov22@gmail.com

interface class I1 {
  void i1_m1(num v1) {}
  void i1_m2(num v1, [num v2 = 0]) {}
  void i1_m3(num v1, {num v2 = 0}) {}
}

interface class I2 {
  void i2_m1(covariant int v1) {}
  void i2_m2(num v1, [covariant int v2 = 0]) {}
  void i2_m3(num v1, {covariant int v2 = 0}) {}
}

class C implements I1, I2 {
  void i1_m1(covariant String i) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i1_m2(num v1, [covariant String v2 = ""]) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i1_m3(num v1, {covariant String v2 = ""}) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i2_m1(String i) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i2_m2(num v1, [String v2 = ""]) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i2_m3(num v1, {String v2 = ""}) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M implements I1, I2 {
  void i1_m1(covariant String i) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i1_m2(num v1, [covariant String v2 = ""]) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i1_m3(num v1, {covariant String v2 = ""}) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i2_m1(String i) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i2_m2(num v1, [String v2 = ""]) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void i2_m3(num v1, {String v2 = ""}) {}
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
