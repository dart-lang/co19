// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A primary constructor is augmented.
///
/// @description Checks that it is a compile-time error if a primary
/// introductory constructor is augmented. Test constant primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class const C1();

augment class C1 {
  augment const C1();
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C2.someName(int x) {
  augment const C2.someName(int x);
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C3._(var int x);

augment class C3 {
  augment const C3._(var int x);
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C4(var int x) {
  augment const C4.new(int x);
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C5.new(final int x);

augment class C5 {
  augment const C5(int x);
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E1() {
  e0();
}

augment enum E1 {
  ;
  augment const E1();
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E2(int x) {
  e0(0);
  augment const E2.new(int x);
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E3(final int x) {
  e0(0);
}

augment enum E3 {
  ;
  augment const new(final int x);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E4._(final int x) {
  e0(0);
  augment const E4._(int x);
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E5.new(final int x) {
  e0(0);
}

augment enum E5 {
  ;
  augment const E5(final int x);
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET1(int id) {}

augment extension type ET1 {
  augment const ET1(int id);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET2._(int id) {
  augment const ET2._(int id);
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET3.new(int id) {
  augment const ET3(int id);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET4(int id) {
  augment const ET4.new(int id);
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET5(int id) {}

augment extension type ET5 {
  augment const new(int id);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
}
