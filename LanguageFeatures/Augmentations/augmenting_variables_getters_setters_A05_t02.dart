// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A getter or setter (including one implicitly induced by a variable
/// declaration) is not complete after all augmentations are applied, unless
/// it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is a compile-time error if an implicit getter is
/// not complete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract final int topLevelVariable;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment int get topLevelVariable;

class C {
  static abstract final int staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticVariable;

  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceVariable;
}

mixin M {
  static abstract final int staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticVariable;

  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceVariable;
}

enum E {
  e0;
  static abstract final int staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticVariable;

  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceVariable;
}

class A {}

extension Ext on A {
  static abstract final int staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticVariable;

  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceVariable;
}

extension type ET(int _) {
  static abstract final int staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticVariable;

  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceVariable;
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
