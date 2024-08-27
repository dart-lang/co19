// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error for both a static and instance member
/// of the same name to be defined on the same type, even if they live in
/// different lexical scopes.
///
/// @description Checks that it is a compile time error for both a static and
/// instance member of the same name to be defined on the same type, even if
/// they live in different lexical scopes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'scoping_A02_t02.dart';

augment class C {
  static String augmentingStatic = "augmentingStatic";
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get augmentingStaticGetter => "augmentingStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set augmentingStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String augmentingStaticMethod() => "augmentingStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String augmentingInstance = "augmentingInstance";
  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {}
  String augmentingMethod() => "augmentingMethod";
}

augment mixin M {
  static String augmentingStatic = "augmentingStatic";
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get augmentingStaticGetter => "augmentingStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set augmentingStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String augmentingStaticMethod() => "augmentingStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String augmentingInstance = "augmentingInstance";
  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {}
  String augmentingMethod() => "augmentingMethod";
}

augment enum E {
  augment e0;
  static final String augmentingStatic = "augmentingStatic";
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get augmentingStaticGetter => "augmentingStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set augmentingStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String augmentingStaticMethod() => "augmentingStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final String augmentingInstance = "augmentingInstance";
  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {}
  String augmentingMethod() => "augmentingMethod";
}

augment extension Ext {
  static String get augmentingStaticGetter => "augmentingStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set augmentingStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String augmentingStaticMethod() => "augmentingStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {}
  String augmentingMethod() => "augmentingMethod";
}

augment extension type ET {
  static String get augmentingStaticGetter => "augmentingStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set augmentingStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String augmentingStaticMethod() => "augmentingStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {}
  String augmentingMethod() => "augmentingMethod";
}
