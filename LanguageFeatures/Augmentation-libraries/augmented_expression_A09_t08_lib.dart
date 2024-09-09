// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// member with a formal parameter whose name is `augmented` occurs in a
/// location where there is an enclosing augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A09_t08.dart';

augment class C {
  static void staticMethod1(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2([int augmented = 0]) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3({int augmented = 0}) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1(int augmented) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2([int augmented = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3({int augmented = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(int augmented) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static void staticMethod1(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2([int augmented = 0]) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3({int augmented = 0}) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1(int augmented) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2([int augmented = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3({int augmented = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(int augmented) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  static void staticMethod1(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2([int augmented = 0]) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3({int augmented = 0}) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1(int augmented) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2([int augmented = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3({int augmented = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(int augmented) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static void staticMethod1(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2([int augmented = 0]) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3({int augmented = 0}) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticSetter(int augmented) {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1(int augmented) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2([int augmented = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3({int augmented = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceSetter(int augmented) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
