// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// member whose return type is a record with named field `augmented` occurs
/// in a location where there is an enclosing augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A09_t09.dart';

augment class C {
  static ({int augmented})? staticVariable = null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? staticMethod() => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? get staticGetter => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? instanceVariable = null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? instanceMethod(int augmented) => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? get instanceGetter => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static ({int augmented})? staticVariable = null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? staticMethod() => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? get staticGetter => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? instanceVariable = null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? instanceMethod(int augmented) => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? get instanceGetter => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  static ({int augmented})? staticVariable = null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? staticMethod() => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? get staticGetter => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final ({int augmented})? instanceVariable = null;
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? instanceMethod(int augmented) => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? get instanceGetter => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static ({int augmented})? staticVariable = null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? staticMethod() => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static ({int augmented})? get staticGetter => null;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? instanceMethod(int augmented) => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({int augmented})? get instanceGetter => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
