// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where the outermost enclosing declaration
/// is augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// getter with the name `augmented` occurs in a location where the outermost
/// enclosing declaration is augmenting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A09_t02.dart';

augment class C1 {
  static String get augmented => "static";
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  String get augmented => "instance";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M1 {
  static String get augmented => "static";
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M2 {
  String get augmented => "instance";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E1 {
  augment e0;
  static String get augmented => "static";
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  augment e0;
  String get augmented => "instance";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext1 {
  static String get augmented => "static";
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext2 {
  String get augmented => "instance";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
