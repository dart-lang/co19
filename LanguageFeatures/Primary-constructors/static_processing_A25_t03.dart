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
/// Finally, `k2` is added to `D2`, and `D` is replaced by `D2`.
///
/// @description Check that it is a compile-time error if a
/// `<primaryConstructorBodySignature>` contains an empty initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1() {
  this:;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2() {
  this: {}
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int v) {
  this:;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int v) {
  this: {}
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E() {
  e0;
  this:;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
  print(E);
}
