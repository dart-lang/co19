// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion More precisely, a function or constructor declaration
/// (introductory or augmenting) is incomplete if all of:
/// - It has no body. That means no `{ ... }` or `=> ...;` but only `;`.
/// - The function is not marked external. An external function is considered to
///   have a body, just not one that is visible as Dart code.
/// - There is no redirection, initializer list, initializing formals, field
///   parameters, or super parameters. Obviously, this only applies to
///   constructor declarations.
///
/// If a declaration is not incomplete then it is complete.
///
/// It's a compile-time error if an augmentation is complete and any declaration
/// before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error to augment an external
/// setter by another complete implicit setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

external void set topLevelSetter1(String _);
String get topLevelSetter1; // Need getter, otherwise augmenting variable augments non-existing getter
augment String topLevelSetter1 = "";
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

external void set topLevelSetter2(String _);
String get topLevelSetter2;
augment external String topLevelSetter2;
//                      ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  external static void set staticSetter(String _);
  static String get staticSetter;
  external void set instanceSetter(String _);
  String get instanceSetter;
}

augment class C {
  augment static String staticSetter = "";
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String instanceSetter;
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  external static void set staticSetter(String _);
  static String get staticSetter;
  external void set instanceSetter(String _);
  String get instanceSetter;
}

augment mixin M {
  augment static String staticSetter = "";
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String instanceSetter;
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  external static void set staticSetter1(String _);
  static String get staticSetter1;
  external static void set staticSetter2(String _);
  static String get staticSetter2;
}

augment enum E {
  ;
  augment static String staticSetter1 = "";
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external static String staticSetter2;
//                               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  external static void set staticSetter1(String _);
  static String get staticSetter1;
  external static void set staticSetter2(String _);
  static String get staticSetter2;
}

augment extension Ext {
  augment static String staticSetter1 = "";
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external static String staticSetter2;
//                               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  external static void set staticSetter1(String _);
  static String get staticSetter1;
  external static void set staticSetter2(String _);
  static String get staticSetter2;
}

augment extension type ET {
  augment static String staticSetter1 = "";
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external static String staticSetter2;
//                               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelSetter1 = "";
  topLevelSetter2 = "";
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
