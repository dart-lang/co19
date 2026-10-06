// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A primary constructor is augmented.
///
/// @description Checks that it is a compile-time error if a primary
/// introductory constructor is augmented. Test augmentation in an augmenting
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1();

augment class C1 {
  augment C1();
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2.someName(int x);

augment class C2 {
  augment C2.someName(int x);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(var int x);

augment class C3 {
  augment C3(var int x);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4._(var int x);

augment class C4 {
  augment C4._(int x);
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5(final int x);

augment class C5 {
  augment C5.new(int x);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6.new(final int x) {
  augment C6(final int x);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1.someName() {
  e0.someName();
}

augment enum E1 {
  ;
  augment E1.someName();
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(int x) {
  e0(0);
}

augment enum E2 {
  ;
  augment E2(int x);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3._(final int x) {
  e0._(0);
}

augment enum E3 {
  ;
  augment E3._(final int x);
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4(final int x) {
  e0(0);
}

augment enum E4 {
  ;
  augment E4.new(int x);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E5.new(final int x) {
  e0(0);
}

augment enum E5 {
  ;
  augment E5(int x);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int id) {}

augment extension type ET1 {
  augment ET1(int id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.someName(int id) {}

augment extension type ET2 {
  augment ET2.someName(int id);
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3._(int id) {}

augment extension type ET3 {
  augment ET3._(int id);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int id) {}

augment extension type ET4 {
    augment ET4.new(int id);
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5.new(int id) {}

augment extension type ET5 {
  augment ET5(int id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
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
