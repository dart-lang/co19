// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error if a mutable library or
/// static variable with a non-nillable type has no initializer after all
/// augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int topLevelVariable1;
//  ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract int topLevelVariable2;

augment abstract int topLevelVariable1;
augment int topLevelVariable2;
//          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static int staticVariable1;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static abstract int staticVariable2;
}

augment class C {
  augment static abstract int staticVariable1;
  augment static int staticVariable2;
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static int staticVariable1;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static abstract int staticVariable2;
}

augment mixin M {
  augment static abstract int staticVariable1;
  augment static int staticVariable2;
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static int staticVariable1;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static abstract int staticVariable2;
}

augment enum E {
  ;
  augment static abstract int staticVariable1;
  augment static int staticVariable2;
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static int staticVariable1;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static abstract int staticVariable2;
}

augment extension Ext {
  augment static abstract int staticVariable1;
  augment static int staticVariable2;
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static int staticVariable1;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static abstract int staticVariable2;
}

augment extension type ET {
  augment static abstract int staticVariable1;
  augment static int staticVariable2;
//                   ^^^^^^^^^^^^^^^
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
