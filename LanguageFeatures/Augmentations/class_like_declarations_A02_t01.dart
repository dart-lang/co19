// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if a class, enum or an
/// extension type marked `augment` has a primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1();

augment class C1() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2(int v);

augment class C2(int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3(var int v);

augment class C3(var int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4(final int v);

augment class C4(final int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E1() {
  e0;
}

augment enum E1() {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E2(int v) {
  e0(0);
}

augment enum E2(int v) {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E3(var int v) {
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(0);
}

augment enum E3(var int v) {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E4(final int v) {
  e0(0);
}

augment enum E4(final int v) {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

extension type ET1(int v) {}

augment extension type ET1(int v) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(final int v) {}

augment extension type ET2(final int v) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(ET1);
  print(ET2);
}
