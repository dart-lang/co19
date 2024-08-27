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

augment library 'scoping_A02_t01.dart';

augment class C {
  String introductoryStatic = "introductoryStatic";
  String get introductoryStaticGetter => "introductoryStaticGetter";
  void set introductoryStaticSetter(String _) {}
  String introductoryStaticMethod() => "introductoryStaticMethod";

  static String introductoryInstance = "introductoryInstance";
//              ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get introductoryGetter => "introductoryGetter";
//                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductorySetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryMethod() => "introductoryMethod";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  String introductoryStatic = "introductoryStatic";
  String get introductoryStaticGetter => "introductoryStaticGetter";
  void set introductoryStaticSetter(String _) {}
  String introductoryStaticMethod() => "introductoryStaticMethod";

  static String introductoryInstance = "introductoryInstance";
//              ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get introductoryGetter => "introductoryGetter";
//                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductorySetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryMethod() => "introductoryMethod";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  final String introductoryStatic = "introductoryStatic";
  String get introductoryStaticGetter => "introductoryStaticGetter";
  void set introductoryStaticSetter(String _) {}
  String introductoryStaticMethod() => "introductoryStaticMethod";

  static final String introductoryInstance = "introductoryInstance";
//                    ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get introductoryGetter => "introductoryGetter";
//                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductorySetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryMethod() => "introductoryMethod";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  String get introductoryStaticGetter => "introductoryStaticGetter";
  void set introductoryStaticSetter(String _) {}
  String introductoryStaticMethod() => "introductoryStaticMethod";

  static String get introductoryGetter => "introductoryGetter";
//                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductorySetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryMethod() => "introductoryMethod";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  String get introductoryStaticGetter => "introductoryStaticGetter";
  void set introductoryStaticSetter(String _) {  }
  String introductoryStaticMethod() => "introductoryStaticMethod";

  static String get introductoryGetter => "introductoryGetter";
//                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductorySetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryMethod() => "introductoryMethod";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final String id = "introductoryMethod";
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
