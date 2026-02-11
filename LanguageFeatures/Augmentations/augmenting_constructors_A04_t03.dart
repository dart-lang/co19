// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is marked `factory` and the augmenting
/// constructor is not, or vice versa.
///
/// @description Checks that it is a compile-time error if a primary
/// introductory constructor is augmented by a `factory` constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1();

augment class C1 {
  augment factory C1();
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int x);

augment class C2 {
  augment factory C2(int x);
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1.foo() {
  e0.foo();
}

augment enum E1 {
  ;
  augment factory E1.foo();
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(final int x) {
  e0(0);
}

augment enum E2 {
  ;
  augment factory E2(int x);
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {}

augment extension type ET {
  augment factory ET(int id);
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET);
}
