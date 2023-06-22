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
/// methods and function type `m` is not a subtype of `m′. Test `extends` and
/// `on` clauses
/// @author sgrekhov22@gmail.com

mixin class I {
  void m1(num v1) {}
  void m2(num v1, [num v2 = 0]) {}
  void m3(num v1, {num v2 = 0}) {}
  void m4(covariant int v1) {}
  void m5(num v1, [covariant int v2 = 0]) {}
  void m6(num v1, {covariant int v2 = 0}) {}
}

class C extends I {
  void m1(covariant String i) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2(num v1, [covariant String v2 = ""]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3(num v1, {covariant String v2 = ""}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m4(String i) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m5(num v1, [String v2 = ""]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m6(num v1, {String v2 = ""}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M on I {
  void m1(covariant String i) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2(num v1, [covariant String v2 = ""]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3(num v1, {covariant String v2 = ""}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m4(String i) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m5(num v1, [String v2 = ""]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified

  void m6(num v1, {String v2 = ""}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
