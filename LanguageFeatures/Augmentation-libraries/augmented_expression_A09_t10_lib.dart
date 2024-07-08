// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where the outermost enclosing declaration
/// is augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// member whose formal parameter is a record with named field `augmented`
/// occurs in a location where the outermost enclosing declaration is augmenting
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A09_t10.dart';

augment class C {
  static void staticMethod(({int augmented}) r) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter(({int augmented}) r) {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(({int augmented}) r) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter(({int augmented}) r) {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static void staticMethod(({int augmented}) r) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter(({int augmented}) r) {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(({int augmented}) r) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter(({int augmented}) r) {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  static void staticMethod(({int augmented}) r) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter(({int augmented}) r) {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(({int augmented}) r) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter(({int augmented}) r) {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static void staticMethod(({int augmented}) r) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter(({int augmented}) r) {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod(({int augmented}) r) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter(({int augmented}) r) {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
