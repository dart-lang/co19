// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A `const` variable declaration is augmented or augmenting.
///
/// @description Checks that it is a compile-time error if a `final` variable is
/// augmented with a `const` variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

final int topLevelVariable1 = 0;
augment const int topLevelVariable1;
//                ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final int topLevelVariable2;
augment const int topLevelConstant2 = 0;
//                ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static final int staticVariable1 = 0;
  augment static const int staticVariable1;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final int staticVariable2;
  augment static const int staticVariable2 = 0;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static final int staticVariable1 = 0;
  augment static const int staticVariable1;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final int staticVariable2;
  augment static const int staticVariable2 = 0;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static final int staticVariable1 = 0;
  augment static const int staticVariable1;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final int staticVariable2;
  augment static const int staticVariable2 = 0;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static final int staticVariable1 = 0;
  augment static const int staticVariable1;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final int staticVariable2;
  augment static const int staticVariable2 = 0;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static final int staticVariable1 = 0;
  augment static const int staticVariable1;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final int staticVariable2;
  augment static const int staticVariable2 = 0;
//                         ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable1);
  print(topLevelVariable2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
