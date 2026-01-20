// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is not omitted,
/// then it's a compile-time error if the type denoted by the augmenting
/// declaration is not the same type as the type in the corresponding
/// declaration being augmented.
///
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a formal parameter type other than the introductory
/// declaration. Test setters and top types (for functions see
/// `augmenting_functions_A04_t24.dart`).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_annotation_inheritance_A06_t03.dart';

augment void topLevelSetter1(void _);
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelSetter2(Object? _);
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelSetter3(dynamic _);
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void staticSetter1(void _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter2(Object? _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter3(dynamic _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceSetter1(void _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter2(Object? _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter3(dynamic _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticSetter1(void _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter2(Object? _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter3(dynamic _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceSetter1(void _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter2(Object? _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter3(dynamic _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment static void staticSetter1(void _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter2(Object? _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter3(dynamic _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceSetter1(void _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter2(Object? _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter3(dynamic _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticSetter1(void _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter2(Object? _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter3(dynamic _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceSetter1(void _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter2(Object? _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter3(dynamic _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static void staticSetter1(void _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter2(Object? _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticSetter3(dynamic _);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceSetter1(void _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter2(Object? _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceSetter3(dynamic _);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
