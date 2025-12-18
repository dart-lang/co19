// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A `const` variable declaration is augmented or augmenting.
///
/// @description Checks that it is a compile-time error to augment a `const`
/// variable with a getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

const int topLevelConstant = 0;
augment int get topLevelConstant;
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static const int staticConstant = 0;
  augment static int get staticConstant;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static const int staticConstant = 0;
  augment static int get staticConstant;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static const int staticConstant = 0;
  augment static int get staticConstant;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static const int staticConstant = 0;
  augment static int get staticConstant;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static const int staticConstant = 0;
  augment static int get staticConstant;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelConstant);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
