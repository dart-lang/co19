// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where the outermost enclosing declaration
/// is augmenting.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// function with `augmented` as a type bound in a location where the outermost
/// enclosing declaration is augmenting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A09_t11.dart';

augment class C {
  static void staticMethod<T extends augmented>() {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod<T extends augmented>() {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static void staticMethod<T extends augmented>() {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod<T extends augmented>() {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  static void staticMethod<T extends augmented>() {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod<T extends augmented>() {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static void staticMethod<T extends augmented>() {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod<T extends augmented>() {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
