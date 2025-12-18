// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A getter or setter (including one implicitly induced by a variable
/// declaration) is not complete after all augmentations are applied, unless
/// it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is a compile-time error if a setter is not
/// complete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void set topLevelSetter(int _);
//       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void set topLevelSetter(int _);

class C {
  static void set staticSetter(int _);
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter(int _);
//         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set staticSetter(int _);
  augment void set instanceSetter(int _);
}

mixin M {
  static void set staticSetter(int _);
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter(int _);
//         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set staticSetter(int _);
  augment void set instanceSetter(int _);
}

enum E {
  e0;
  static void set staticSetter(int _);
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter(int _);
//         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set staticSetter(int _);
  augment void set instanceSetter(int _);
}

class A {}

extension Ext on A {
  static void set staticSetter(int _);
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter(int _);
//         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set staticSetter(int _);
  augment void set instanceSetter(int _);
}

extension type ET(int _) {
  static void set staticSetter(int _);
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter(int _);
//         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set staticSetter(int _);
  augment void set instanceSetter(int _);
}

main() {
  topLevelSetter = 0;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
