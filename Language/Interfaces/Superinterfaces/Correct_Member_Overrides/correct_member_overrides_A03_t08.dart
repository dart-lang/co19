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
/// @description Checks that it is not an error if `m` and `m′` are both methods
/// and function type `m` is a subtype of `m′. Test `implements` clause
/// @author sgrekhov22@gmail.com

interface class I1 {
  void m1(num v1) {}
  void m2(num v1, [num v2 = 0]) {}
  void m3(num v1, {num v2 = 0}) {}
}

interface class I2 {
  void m1(covariant int v1) {}
  void m2(num v1, [covariant int v2 = 0]) {}
  void m3(num v1, {covariant int v2 = 0}) {}
}

class C implements I1, I2 {
  void m1(covariant int i) {}
  void m2(num v1, [covariant Object v2 = ""]) {}
  void m3(num v1, {covariant int v2 = 0}) {}
}

mixin M implements I1, I2 {
  void m1(num i) {}
  void m2(num v1, [Object v2 = ""]) {}
  void m3(num v1, {int v2 = 0}) {}
}

main() {
  print(C);
  print(M);
}
