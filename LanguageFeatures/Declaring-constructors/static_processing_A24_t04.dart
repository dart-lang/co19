// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the declaring constructor is found in the
/// following steps, where `D` is the class, extension type, or enum declaration
/// in the program that includes a declaring constructor `k`, and `D2` is the
/// result of the derivation of the semantics of `D`. The derivation step will
/// delete elements that amount to the declaring constructor. Semantically, it
/// will add a new constructor `k2`, and it will add zero or more instance
/// variable declarations.
/// ...
/// If there is an initializer list following the formal parameter list `L` then
/// `k2` has an initializer list with the same elements in the same order.
///
/// @description Check that it is a compile-time error if an instance variable
/// is initialized both by an initializing formal or by a declaring formal
/// parameter of a declaring constructor and in the initializer list. Test
/// extension types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

extension type ET1(int x) {
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(final int x) {
  this: x = 2;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3([int x = 0]) {
  this: x = 3;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4([final int x = 0]) {
  this: x = 4;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5({int x = 0}) {
  this: x = 5;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6({final int x = 0}) {
  this: x = 6;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET7({required int x}) {
  this: x = 7;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET8({required final int x}) {
  this: x = 8;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET9 {
  this(final int x) : x = 9;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET10 {
  this([final int x = 0]) : x = 10;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET11 {
  this({final int x = 0}) : x = 11;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET12 {
  this({required final int x}) : x = 12;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
  print(ET7);
  print(ET8);
  print(ET9);
  print(ET10);
  print(ET11);
  print(ET12);
}
