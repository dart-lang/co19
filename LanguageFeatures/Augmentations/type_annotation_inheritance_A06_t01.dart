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
/// declaration. Test setters (for functions see
/// augmenting_functions_A04_t07.dart).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void set topLevelSetter1(num v) {}

augment void set topLevelSetter1(Object v);
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void set topLevelSetter2(num v);

augment void set topLevelSetter2(int v) {}
//                               ^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void set staticSetter1(num v) {}
  static void set staticSetter2(num v);
  void set instanceSetter1(num v) {}
  void set instanceSetter2(num v);
}

augment class C {
  augment static void set staticSetter1(Object v);
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter2(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter1(Object v);
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter2(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void set staticSetter1(num v) {}
  static void set staticSetter2(num v);
  void set instanceSetter1(num v) {}
  void set instanceSetter2(num v);
}

augment mixin M {
  augment static void set staticSetter1(Object v);
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter2(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter1(Object v);
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter2(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void set staticSetter1(num v) {}
  static void set staticSetter2(num v);
  void set instanceSetter1(num v) {}
  void set instanceSetter2(num v);
}

augment enum E {
  ;
  augment static void set staticSetter1(Object v);
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter2(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter1(Object v);
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter2(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void set staticSetter1(num v) {}
  static void set staticSetter2(num v);
  void set instanceSetter1(num v) {}
  void set instanceSetter2(num v);
}

augment extension Ext {
  augment static void set staticSetter1(Object v);
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter2(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter1(Object v);
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter2(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  static void set staticSetter1(num v) {}
  static void set staticSetter2(num v);
  void set instanceSetter1(num v) {}
  void set instanceSetter2(num v);
}

augment extension type ET {
  augment static void set staticSetter1(Object v);
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter2(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter1(Object v);
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter2(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
main() {
  topLevelSetter1 = 0;
  topLevelSetter2 = 0;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
