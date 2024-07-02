// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the name
/// `augmented` occurs in a location where the outermost enclosing declaration
/// is augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// member with a formal parameter whose name is `augmented` occurs in a
/// location where the outermost enclosing declaration is augmenting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A09_t05.dart';

augment class C {
  static void staticMethod1<augmented>(int v) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2<augmented>([int v = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3<augmented>({int v = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1<augmented>(int v) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2<augmented>([int v = 0]) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3<augmented>({int v = 0}) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static void staticMethod1<augmented>(int v) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2<augmented>([int v = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3<augmented>({int v = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1<augmented>(int v) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2<augmented>([int v = 0]) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3<augmented>({int v = 0}) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  static void staticMethod1<augmented>(int v) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2<augmented>([int v = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3<augmented>({int v = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1<augmented>(int v) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2<augmented>([int v = 0]) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3<augmented>({int v = 0}) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static void staticMethod1<augmented>(int v) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod2<augmented>([int v = 0]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod3<augmented>({int v = 0}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod1<augmented>(int v) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod2<augmented>([int v = 0]) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod3<augmented>({int v = 0}) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
