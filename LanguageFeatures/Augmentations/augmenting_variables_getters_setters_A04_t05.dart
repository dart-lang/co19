// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A `const` variable declaration is augmented or augmenting.
///
/// @description Checks that it is a compile-time error if a getter is
/// augmented with a `const` variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int get topLevelGetter1 => 0;
augment const int topLevelGetter1;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int get topLevelGetter2;
augment const int topLevelGetter2 = 0;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static int get staticGetter1 => 0;
  augment static const int staticGetter1;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static int get staticGetter2;
  augment static const int staticGetter2 = 0;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static int get staticGetter1 => 0;
  augment static const int staticGetter1;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static int get staticGetter2;
  augment static const int staticGetter2 = 0;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static int get staticGetter1 => 0;
  augment static const int staticGetter1;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static int get staticGetter2;
  augment static const int staticGetter2 = 0;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static int get staticGetter1 => 0;
  augment static const int staticGetter1;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static int get staticGetter2;
  augment static const int staticGetter2 = 0;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static int get staticGetter1 => 0;
  augment static const int staticGetter1;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static int get staticGetter2;
  augment static const int staticGetter2 = 0;
//                         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelGetter1);
  print(topLevelGetter2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
