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
/// @description Check that it is a compile-time error if a parameter of a
/// declaring constructor is initialized both in the constructor and in the
/// initializer list. Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

enum E1(final int x) {
  e0(0);
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2([final int x = 0]) {
  e0(0);
  this: x = 2;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3({int x = 0}) {
  e(x: 0);
  this: x = 5;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4({required final int x}) {
  e(x: 0);
  this: x = 4;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E5(this.x) {
  e0(0);
  final int x;
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E6([this.x = 0]) {
  e0(0);
  final int x;
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E7({this.x = 0}) {
  e0(x: 0);
  final int x;
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E8({required this.x}) {
  e0(x: 0);
  final int x;
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E9 {
  e0(0);
  const this(final int x) : x = 9;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E10 {
  e0(0);
  const this([final int x = 0]) : x = 10;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E11 {
  e(x: 0);
  const this({int x = 0}) : x = 11;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E12 {
  e(x: 0);
  const this({required final int x}) : x = 12;
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E13 {
  e0(0);
  final int x;
  const this(this.x) : x = 13;
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E14 {
  e0(0);
  final int x;
  const this([this.x = 0]) : x = 14;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E15 {
  e0(x: 0);
  final int x;
  const this({this.x = 0}) : x = 15;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E16 {
  e0(x: 0);
  final int x;
  const this({required this.x}) : x = 16;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
  print(E7);
  print(E8);
  print(E9);
  print(E10);
  print(E11);
  print(E12);
  print(E13);
  print(E14);
  print(E15);
  print(E16);
}
