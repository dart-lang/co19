// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may omit type annotations for a return
/// type, variable type, parameter type, or type parameter bound. In the last
/// case, that includes omitting the `extends` keyword. For a variable, a `var`
/// keyword replaces the type if the variable isn't `final`.
///
/// If a type annotation or type parameter bound is omitted in the augmenting
/// declaration, it is inferred to be the same as the corresponding type
/// annotation or type parameter bound in the declaration being augmented.
///
/// @description Checks that it is not an error if an augmentation omits the
/// type of the formal parameter of an augmenting setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void set topLevelSetter1(int v) {}
void set topLevelSetter2(Object? v) {}
void set topLevelSetter3(dynamic v) {}
void set topLevelSetter4(Null v) {}
void set topLevelSetter5(void v) {}
void set topLevelSetter6(Never v) {}

augment void set topLevelSetter1(v);
augment void set topLevelSetter2(_);
augment void set topLevelSetter3(v);
augment void set topLevelSetter4(_);
augment void set topLevelSetter5(v);
augment void set topLevelSetter6(_);

class C {
  static void set staticSetter1(int v) {}
  static void set staticSetter2(Object? v) {}
  static void set staticSetter3(dynamic v) {}
  static void set staticSetter4(Null v) {}
  static void set staticSetter5(void v) {}
  static void set staticSetter6(Never v) {}

  void set instanceSetter1(int v) {}
  void set instanceSetter2(Object? v) {}
  void set instanceSetter3(dynamic v) {}
  void set instanceSetter4(Null v) {}
  void set instanceSetter5(void v) {}
  void set instanceSetter6(Never v) {}
}

augment class C {
  augment static void set staticSetter1(v);
  augment static void set staticSetter2(_);
  augment static void set staticSetter3(v);
  augment static void set staticSetter4(_);
  augment static void set staticSetter5(v);
  augment static void set staticSetter6(_);

  augment void set instanceSetter1(_);
  augment void set instanceSetter2(v);
  augment void set instanceSetter3(_);
  augment void set instanceSetter4(v);
  augment void set instanceSetter5(_);
  augment void set instanceSetter6(v);
}

mixin M {
  static void set staticSetter1(int v) {}
  static void set staticSetter2(Object? v) {}
  static void set staticSetter3(dynamic v) {}
  static void set staticSetter4(Null v) {}
  static void set staticSetter5(void v) {}
  static void set staticSetter6(Never v) {}

  void set instanceSetter1(int v) {}
  void set instanceSetter2(Object? v) {}
  void set instanceSetter3(dynamic v) {}
  void set instanceSetter4(Null v) {}
  void set instanceSetter5(void v) {}
  void set instanceSetter6(Never v) {}
}

augment mixin M {
  augment static void set staticSetter1(v);
  augment static void set staticSetter2(_);
  augment static void set staticSetter3(v);
  augment static void set staticSetter4(_);
  augment static void set staticSetter5(v);
  augment static void set staticSetter6(_);

  augment void set instanceSetter1(_);
  augment void set instanceSetter2(v);
  augment void set instanceSetter3(_);
  augment void set instanceSetter4(v);
  augment void set instanceSetter5(_);
  augment void set instanceSetter6(v);
}

enum E {
  e1;
  static void set staticSetter1(int v) {}
  static void set staticSetter2(Object? v) {}
  static void set staticSetter3(dynamic v) {}
  static void set staticSetter4(Null v) {}
  static void set staticSetter5(void v) {}
  static void set staticSetter6(Never v) {}

  void set instanceSetter1(int v) {}
  void set instanceSetter2(Object? v) {}
  void set instanceSetter3(dynamic v) {}
  void set instanceSetter4(Null v) {}
  void set instanceSetter5(void v) {}
  void set instanceSetter6(Never v) {}
}

augment enum E {
  ;
  augment static void set staticSetter1(v);
  augment static void set staticSetter2(_);
  augment static void set staticSetter3(v);
  augment static void set staticSetter4(_);
  augment static void set staticSetter5(v);
  augment static void set staticSetter6(_);

  augment void set instanceSetter1(_);
  augment void set instanceSetter2(v);
  augment void set instanceSetter3(_);
  augment void set instanceSetter4(v);
  augment void set instanceSetter5(_);
  augment void set instanceSetter6(v);
}

class A {}

extension Ext on A {
  static void set staticSetter1(int v) {}
  static void set staticSetter2(Object? v) {}
  static void set staticSetter3(dynamic v) {}
  static void set staticSetter4(Null v) {}
  static void set staticSetter5(void v) {}
  static void set staticSetter6(Never v) {}

  void set instanceSetter1(int v) {}
  void set instanceSetter2(Object? v) {}
  void set instanceSetter3(dynamic v) {}
  void set instanceSetter4(Null v) {}
  void set instanceSetter5(void v) {}
  void set instanceSetter6(Never v) {}
}

augment extension Ext {
  augment static void set staticSetter1(v);
  augment static void set staticSetter2(_);
  augment static void set staticSetter3(v);
  augment static void set staticSetter4(_);
  augment static void set staticSetter5(v);
  augment static void set staticSetter6(_);

  augment void set instanceSetter1(_);
  augment void set instanceSetter2(v);
  augment void set instanceSetter3(_);
  augment void set instanceSetter4(v);
  augment void set instanceSetter5(_);
  augment void set instanceSetter6(v);
}

extension type ET(int _) {
  static void set staticSetter1(int v) {}
  static void set staticSetter2(Object? v) {}
  static void set staticSetter3(dynamic v) {}
  static void set staticSetter4(Null v) {}
  static void set staticSetter5(void v) {}
  static void set staticSetter6(Never v) {}

  void set instanceSetter1(int v) {}
  void set instanceSetter2(Object? v) {}
  void set instanceSetter3(dynamic v) {}
  void set instanceSetter4(Null v) {}
  void set instanceSetter5(void v) {}
  void set instanceSetter6(Never v) {}
}

augment extension type ET {
  augment static void set staticSetter1(v);
  augment static void set staticSetter2(_);
  augment static void set staticSetter3(v);
  augment static void set staticSetter4(_);
  augment static void set staticSetter5(v);
  augment static void set staticSetter6(_);

  augment void set instanceSetter1(_);
  augment void set instanceSetter2(v);
  augment void set instanceSetter3(_);
  augment void set instanceSetter4(v);
  augment void set instanceSetter5(_);
  augment void set instanceSetter6(v);
}

class MA = Object with M;

main() {
  topLevelSetter1 = 42;
  topLevelSetter2 = null;
  topLevelSetter3 = null;
  topLevelSetter4 = null;
  topLevelSetter5 = null;
  // topLevelSetter6 cannot be tested.
  // - passing an argument whose static type is Never proves nothing
  // - a setter cannot be torn-off to check its static type

  C.staticSetter1 = 42;
  C.staticSetter2 = null;
  C.staticSetter3 = null;
  C.staticSetter4 = null;
  C.staticSetter5 = null;
  C().instanceSetter1 = 42;
  C().instanceSetter2 = null;
  C().instanceSetter3 = null;
  C().instanceSetter4 = null;
  C().instanceSetter5 = null;

  M.staticSetter1 = 42;
  M.staticSetter2 = null;
  M.staticSetter3 = null;
  M.staticSetter4 = null;
  M.staticSetter5 = null;
  MA().instanceSetter1 = 42;
  MA().instanceSetter2 = null;
  MA().instanceSetter3 = null;
  MA().instanceSetter4 = null;
  MA().instanceSetter5 = null;

  E.staticSetter1 = 42;
  E.staticSetter2 = null;
  E.staticSetter3 = null;
  E.staticSetter4 = null;
  E.staticSetter5 = null;
  E.e1.instanceSetter1 = 42;
  E.e1.instanceSetter2 = null;
  E.e1.instanceSetter3 = null;
  E.e1.instanceSetter4 = null;
  E.e1.instanceSetter5 = null;

  Ext.staticSetter1 = 42;
  Ext.staticSetter2 = null;
  Ext.staticSetter3 = null;
  Ext.staticSetter4 = null;
  Ext.staticSetter5 = null;
  A().instanceSetter1 = 42;
  A().instanceSetter2 = null;
  A().instanceSetter3 = null;
  A().instanceSetter4 = null;
  A().instanceSetter5 = null;

  ET.staticSetter1 = 42;
  ET.staticSetter2 = null;
  ET.staticSetter3 = null;
  ET.staticSetter4 = null;
  ET.staticSetter5 = null;
  ET(0).instanceSetter1 = 42;
  ET(0).instanceSetter2 = null;
  ET(0).instanceSetter3 = null;
  ET(0).instanceSetter4 = null;
  ET(0).instanceSetter5 = null;
}
