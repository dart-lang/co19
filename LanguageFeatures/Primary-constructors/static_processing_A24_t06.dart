// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// If there is an initializer list following the formal parameter list `L` then
/// `k2` has an initializer list with the same elements in the same order.
///
/// @description Check that it is a compile-time error if an instance variable
/// is initialized in the initializer list more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C(int v) {
  int x;
  this : x = 1, x = v;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E(int v) {
  e0(0);
  final int x;
  this : x = 1, x = v;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
