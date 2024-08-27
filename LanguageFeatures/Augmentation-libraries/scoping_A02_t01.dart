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

import augment 'scoping_A02_t01_lib.dart';

class C {
  static String introductoryStatic = "introductoryStatic";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get introductoryStaticGetter => "introductoryStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductoryStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryStaticMethod() => "introductoryStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String introductoryInstance = "introductoryInstance";
  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {}
  String introductoryMethod() => "introductoryMethod";
}

mixin M {
  static String introductoryStatic = "introductoryStatic";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get introductoryStaticGetter => "introductoryStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductoryStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryStaticMethod() => "introductoryStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String introductoryInstance = "introductoryInstance";
  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {}
  String introductoryMethod() => "introductoryMethod";
}

enum E {
  e0;
  static String introductoryStatic = "introductoryStatic";
//              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get introductoryStaticGetter => "introductoryStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductoryStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryStaticMethod() => "introductoryStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final String introductoryInstance = "introductoryInstance";
  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {}
  String introductoryMethod() => "introductoryMethod";
}

class A {}

extension Ext on A {
  static String get introductoryStaticGetter => "introductoryStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductoryStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryStaticMethod() => "introductoryStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {}
  String introductoryMethod() => "introductoryMethod";
}

extension type ET(String id) {
  static String get introductoryStaticGetter => "introductoryStaticGetter";
//                  ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set introductoryStaticSetter(String _) {}
//                ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String introductoryStaticMethod() => "introductoryStaticMethod";
//              ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {}
  String introductoryMethod() => "introductoryMethod";
}

main() {
  print(C);
  print(M);
  print(E);
  print(Ext);
  print(ET);
}
