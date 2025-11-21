// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A primary constructor declaration consists of a
/// `<primaryConstructor>` in the declaration header plus optionally a member
/// declaration in the body that starts with a
/// `<primaryConstructorBodySignature>`.
///
/// @description Check that it is a compile-time error if a
/// `<primaryConstructorBodySignature>` contains a body but the
/// `<primaryConstructor>` is a constant.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class const C1() {
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C2(int x) {
  final int x;
  this: x = x {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C3(final int x) {
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C4(this.x) {
  final int x;
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A(final int x);

class const C5(super.x) extends A {
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET1(int v) {
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET2.someName(int v) {
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1(final int v) {
  e0(0);
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E2.someName(this.v) {
  e0(0);
  final int v;
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E3(int v) {
  e0(0);
  final int v;
  this: v = v {}
//            ^
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
