// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for a declaring parameter to be
/// declared with the name `_`, except when every element in the augmentation
/// chain for that formal parameter is declared with the name `_`.
///
/// @description Check that it is a compile-time error if a declaring parameter
/// is declared with the name `_` and there is an element in the augmentation
/// chain which is declared with the name other that `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1(var int _);
augment class C1(int x);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

class C2(var int _);
augment class C2(int _x);
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3(var int _);
augment class C3(int __);
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4(final int _);
augment class C4(int x);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

class C5(final int _);
augment class C5(int _x);
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

class C6(final int _);
augment class C6(int __);
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E1(final int _) {
  e0(0);
}

augment enum E1(int x) {
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E2(final int _) {
  e0(0);
}

augment enum E2(int _x) {
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
    ;
}

enum E3(final int _) {
  e0(0);
}

augment enum E3(int __) {
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
    ;
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
}
