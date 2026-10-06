// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if a class, enum or an
/// extension type marked `augment` contains a primary constructor initializer
/// block.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1();

augment class C1 {
  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int v);

augment class C2 {
  this {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(var int v);

augment class C3 {
  int x;
  this: x = 1;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4(int v) {
  this;
}

augment class C4 {
  this: assert(v > 0);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5(int v) {
  this {}
}

augment class C4 {
  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1() {
  e0;
}

augment enum E1 {
  ;
  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(final int v) {
  e0(0);
  this;
}

augment enum E2 {
  ;
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3(final int v) {
  e0(0);
  final int x;
  this;
}

augment enum E3 {
  ;
  augment this: assert(x >= 0);
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4(final int v) {
  e0(0);
  final int x;
  this {}
}

augment enum E4 {
  ;
  this: assert(x >= 0);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int _) {}

augment extension type ET1 {
  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int v) {}

augment extension type ET2 {
  this {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int v) {}

augment extension type ET3 {
  this: assert(v > 0);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int v) {
  this;
}

augment extension type ET4 {
  this: assert(v > 0);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5(int v) {
  this {}
}

augment extension type ET5 {
  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
}
