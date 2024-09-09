// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// member with a formal parameter whose type name is `augmented` occurs in a
/// location where there is an enclosing augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A09_t07.dart';

augment class C {
  static void staticMethod(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static void staticMethod(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  static void staticMethod(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static void staticMethod(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(augmented _) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(augmented _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
