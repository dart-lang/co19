// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A getter or setter (including one implicitly induced by a variable
/// declaration) is not complete after all augmentations are applied, unless
/// it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is a compile-time error if a getter is not
/// complete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int get topLevelGetter;
//      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment int get topLevelGetter;

class C {
  static int get staticGetter;
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get instanceGetter;
//        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment static int get staticGetter;
  augment int get instanceGetter;
}

mixin M {
  static int get staticGetter;
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get instanceGetter;
//        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment static int get staticGetter;
  augment int get instanceGetter;
}

enum E {
  e0;
  static int get staticGetter;
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get instanceGetter;
//        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment static int get staticGetter;
  augment int get instanceGetter;
}

class A {}

extension Ext on A {
  static int get staticGetter;
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get instanceGetter;
//        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment static int get staticGetter;
  augment int get instanceGetter;
}

extension type ET(int _) {
  static int get staticGetter;
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get instanceGetter;
//        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment static int get staticGetter;
  augment int get instanceGetter;
}

main() {
  print(topLevelGetter);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
