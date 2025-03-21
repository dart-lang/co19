// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// variables with the name `augmented` occurs in a location where there is an
/// enclosing augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A09_t01.dart';

augment class C1 {
  static String augmented = "static";
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  String augmented = "instance";
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M1 {
  static String augmented = "static";
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M2 {
  String augmented = "instance";
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  static String augmented = "static";
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static String augmented = "static";
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  static String augmented = "static";
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
