// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if there is no matching declaration `I`.
/// In other words, it's an error to have a declaration marked augment with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error if a setter is
/// augmenting a non-existent setter (a `late final` variable with an
/// initializing expression doesn't have a setter).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

late final String topLevelVariable = "";

augment void set topLevelVariable(String _); // There is no setter to augment
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static late final String staticVariable = "";
  late final String instanceVariable = "";

  augment static void set staticVariable(String _);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set instanceVariable(String _);
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static late final String staticVariable = "";
  late final String instanceVariable = "";

  augment static void set staticVariable(String _);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set instanceVariable(String _);
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static late final String staticVariable = "";

  augment static void set staticVariable(String _);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static late final String staticVariable = "";

  augment static void set staticVariable(String _);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(String _) {
  static late final String staticVariable = "";

  augment static void set staticVariable(String _);
//                        ^^^^^^^^^^^^^^
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
