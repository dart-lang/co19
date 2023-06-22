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
/// @description Checks that it is not an error if `m` and `m′` are both setters
/// and function type `m` is a subtype of `m′. Test `implements` clause
/// @author sgrekhov22@gmail.com

interface class I1 {
  void set m(num v1) {}
}

interface class I2 {
  void set m(covariant int v1) {}
}

class C implements I1, I2 {
  void set m(covariant int i) {}
}

mixin M implements I1, I2 {
  void set m(num i) {}
}

main() {
  print(C);
  print(M);
}
