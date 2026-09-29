// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if a class, enum or
/// extension type marked `augment` has a `const` primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class const C1();

augment class const C1() {}
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

class const C2(final int v);

augment class const C2(final int v) {}
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

class const C3.someName(final int v);

augment class const C3.someName(final int v) {}
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

enum const E1(final int v) {
  e0(0);
}

augment enum const E1(final int v) {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum const E2.someName(final int v) {
  e0.someName(0);
}

augment enum const E1.someName(final int v) {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
    ;
}

extension type const ET1(int _);

augment extension type const ET1(int _) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

extension type const ET2(final int v);

augment extension type const ET2(final int v) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

extension type const ET3.someName(final int v);

augment extension type const ET3.someName(final int v) {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
  print(ET3);
}
