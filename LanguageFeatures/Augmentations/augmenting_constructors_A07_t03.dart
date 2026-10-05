// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A primary constructor is augmented.
///
/// @description Checks that it is a compile-time error if a primary
/// introductory constructor is augmented. Test augmentation of a primary
/// constructor with default name by constructor with the name `new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1();

augment class C1 {
  augment new();
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(int x) {
  augment new(int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(var int x);

augment class C3 {
  augment new(var int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4(var int x) {
  augment new(int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5(final int x);

augment class C5 {
  augment new(int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1() {
  e0();
}

augment enum E1 {
  ;
  augment new();
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(int x) {
  e0(0);
  augment new(int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3(final int x) {
  e0(0);
}

augment enum E3 {
  ;
  augment new(final int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4(final int x) {
  e0(0);
  augment new(int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int id) {}

augment extension type ET1 {
  augment new(int id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {
  augment new(int id);
//        ^^^^^^^^^^^^
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
  print(ET1);
  print(ET2);
}
