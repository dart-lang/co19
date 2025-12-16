// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if there is no matching declaration `I`.
/// In other words, it's an error to have a declaration marked augment with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error if an implicit getter is
/// augmenting a non-existent getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void set topLevelSetter(String _);

augment String topLevelSetter = ""; // There is no getter to augment
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void set staticSetter(String _);
  void set instanceSetter(String _);

  augment static String staticSetter = "";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment String instanceSetter = "";
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void set staticSetter(String _);
  void set instanceSetter(String _);

  augment static String staticSetter = "";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment String instanceSetter = "";
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void set staticSetter(String _);
  void set instanceSetter(String _);

  augment static String staticSetter = "";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment String instanceSetter = "";
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void set staticSetter(String _);
  void set instanceSetter(String _);

  augment static String staticSetter = "";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment String instanceSetter = "";
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void set staticSetter(String _);
  void set instanceSetter(String _);

  augment static String staticSetter = "";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment String instanceSetter = "";
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelSetter = "";
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
