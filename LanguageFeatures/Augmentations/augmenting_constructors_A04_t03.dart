// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is marked `factory` and the augmenting
/// constructor is not, or vice versa.
///
/// @description Checks that it is a compile-time error if the introductory
/// constructor is marked `factory` and the augmenting constructor is not. Test
/// primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C();

augment class C {
  augment factory C();
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E.foo() {
  e0.foo();
}

augment enum E {
  ;
  augment factory E.foo();
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
  print(C);
  print(E);
  print(ET);
}
