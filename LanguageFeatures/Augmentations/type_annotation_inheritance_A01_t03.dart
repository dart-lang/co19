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
/// type of the formal parameter of an augmenting function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

void topLevelFunction1(int v) {}
void topLevelFunction2([Object? v]) {}
void topLevelFunction3({dynamic v}) {}
void topLevelFunction4({required Null v}) {}
void topLevelFunction5(void v) {}
void topLevelFunction6(Never v) {}

augment void topLevelFunction1(v);
augment void topLevelFunction2([_]);
augment void topLevelFunction3({v});
augment void topLevelFunction4({required _});
augment void topLevelFunction5(v);
augment void topLevelFunction6(_);

class C {
  static void staticMethod1(int v) {}
  static void staticMethod2([Object? v]) {}
  static void staticMethod3({dynamic v}) {}
  static void staticMethod4({required Null v}) {}
  static void staticMethod5(void v) {}
  static void staticMethod6(Never v) {}

  void instanceMethod1(int v) {}
  void instanceMethod2([Object? v]) {}
  void instanceMethod3({dynamic v}) {}
  void instanceMethod4({required Null v}) {}
  void instanceMethod5(void v) {}
  void instanceMethod6(Never v) {}
}

augment class C {
  augment static void staticMethod1(v);
  augment static void staticMethod2([_]);
  augment static void staticMethod3({v});
  augment static void staticMethod4({required _});
  augment static void staticMethod5(v);
  augment static void staticMethod6(_);

  augment void instanceMethod1(_) {}
  augment void instanceMethod2([v]) {}
  augment void instanceMethod3({_}) {}
  augment void instanceMethod4({required v}) {}
  augment void instanceMethod5(_) {}
  augment void instanceMethod6(v) {}
}

mixin M {
  static void staticMethod1(int v) {}
  static void staticMethod2([Object? v]) {}
  static void staticMethod3({dynamic v}) {}
  static void staticMethod4({required Null v}) {}
  static void staticMethod5(void v) {}
  static void staticMethod6(Never v) {}

  void instanceMethod1(int v) {}
  void instanceMethod2([Object? v]) {}
  void instanceMethod3({dynamic v}) {}
  void instanceMethod4({required Null v}) {}
  void instanceMethod5(void v) {}
  void instanceMethod6(Never v) {}
}

augment mixin M {
  augment static void staticMethod1(v);
  augment static void staticMethod2([_]);
  augment static void staticMethod3({v});
  augment static void staticMethod4({required _});
  augment static void staticMethod5(v);
  augment static void staticMethod6(_);

  augment void instanceMethod1(_) {}
  augment void instanceMethod2([v]) {}
  augment void instanceMethod3({_}) {}
  augment void instanceMethod4({required v}) {}
  augment void instanceMethod5(_) {}
  augment void instanceMethod6(v) {}
}

enum E {
  e1;
  static void staticMethod1(int v) {}
  static void staticMethod2([Object? v]) {}
  static void staticMethod3({dynamic v}) {}
  static void staticMethod4({required Null v}) {}
  static void staticMethod5(void v) {}
  static void staticMethod6(Never v) {}

  void instanceMethod1(int v) {}
  void instanceMethod2([Object? v]) {}
  void instanceMethod3({dynamic v}) {}
  void instanceMethod4({required Null v}) {}
  void instanceMethod5(void v) {}
  void instanceMethod6(Never v) {}
}

augment enum E {
  ;
  augment static void staticMethod1(v);
  augment static void staticMethod2([_]);
  augment static void staticMethod3({v});
  augment static void staticMethod4({required _});
  augment static void staticMethod5(v);
  augment static void staticMethod6(_);

  augment void instanceMethod1(_) {}
  augment void instanceMethod2([v]) {}
  augment void instanceMethod3({_}) {}
  augment void instanceMethod4({required v}) {}
  augment void instanceMethod5(_) {}
  augment void instanceMethod6(v) {}
}

class A {}

extension Ext on A {
  static void staticMethod1(int v) {}
  static void staticMethod2([Object? v]) {}
  static void staticMethod3({dynamic v}) {}
  static void staticMethod4({required Null v}) {}
  static void staticMethod5(void v) {}
  static void staticMethod6(Never v) {}

  void instanceMethod1(int v) {}
  void instanceMethod2([Object? v]) {}
  void instanceMethod3({dynamic v}) {}
  void instanceMethod4({required Null v}) {}
  void instanceMethod5(void v) {}
  void instanceMethod6(Never v) {}
}

augment extension Ext {
  augment static void staticMethod1(v);
  augment static void staticMethod2([_]);
  augment static void staticMethod3({v});
  augment static void staticMethod4({required _});
  augment static void staticMethod5(v);
  augment static void staticMethod6(_);

  augment void instanceMethod1(_) {}
  augment void instanceMethod2([v]) {}
  augment void instanceMethod3({_}) {}
  augment void instanceMethod4({required v}) {}
  augment void instanceMethod5(_) {}
  augment void instanceMethod6(v) {}
}

extension type ET(int _) {
  static void staticMethod1(int v) {}
  static void staticMethod2([Object? v]) {}
  static void staticMethod3({dynamic v}) {}
  static void staticMethod4({required Null v}) {}
  static void staticMethod5(void v) {}
  static void staticMethod6(Never v) {}

  void instanceMethod1(int v) {}
  void instanceMethod2([Object? v]) {}
  void instanceMethod3({dynamic v}) {}
  void instanceMethod4({required Null v}) {}
  void instanceMethod5(void v) {}
  void instanceMethod6(Never v) {}
}

augment extension type ET {
  augment static void staticMethod1(v);
  augment static void staticMethod2([_]);
  augment static void staticMethod3({v});
  augment static void staticMethod4({required _});
  augment static void staticMethod5(v);
  augment static void staticMethod6(_);

  augment void instanceMethod1(_) {}
  augment void instanceMethod2([v]) {}
  augment void instanceMethod3({_}) {}
  augment void instanceMethod4({required v}) {}
  augment void instanceMethod5(_) {}
  augment void instanceMethod6(v) {}
}

class MA = Object with M;

main() {
  topLevelFunction1.expectStaticType<Exactly<void Function(int)>>();
  topLevelFunction2.expectStaticType<Exactly<void Function([Object?])>>();
  topLevelFunction3.expectStaticType<Exactly<void Function({dynamic v})>>();
  topLevelFunction4.expectStaticType<Exactly<void Function({required Null v})>>();
  topLevelFunction5.expectStaticType<Exactly<void Function(void)>>();
  topLevelFunction6.expectStaticType<Exactly<void Function(Never)>>();

  C.staticMethod1.expectStaticType<Exactly<void Function(int)>>();
  C.staticMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  C.staticMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  C.staticMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  C.staticMethod5.expectStaticType<Exactly<void Function(void)>>();
  C.staticMethod6.expectStaticType<Exactly<void Function(Never)>>();
  var c = C();
  c.instanceMethod1.expectStaticType<Exactly<void Function(int)>>();
  c.instanceMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  c.instanceMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  c.instanceMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  c.instanceMethod5.expectStaticType<Exactly<void Function(void)>>();
  c.instanceMethod6.expectStaticType<Exactly<void Function(Never)>>();

  M.staticMethod1.expectStaticType<Exactly<void Function(int)>>();
  M.staticMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  M.staticMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  M.staticMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  M.staticMethod5.expectStaticType<Exactly<void Function(void)>>();
  M.staticMethod6.expectStaticType<Exactly<void Function(Never)>>();
  var m = MA();
  m.instanceMethod1.expectStaticType<Exactly<void Function(int)>>();
  m.instanceMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  m.instanceMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  m.instanceMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  m.instanceMethod5.expectStaticType<Exactly<void Function(void)>>();
  m.instanceMethod6.expectStaticType<Exactly<void Function(Never)>>();

  E.staticMethod1.expectStaticType<Exactly<void Function(int)>>();
  E.staticMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  E.staticMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  E.staticMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  E.staticMethod5.expectStaticType<Exactly<void Function(void)>>();
  E.staticMethod6.expectStaticType<Exactly<void Function(Never)>>();
  E.e1.instanceMethod1.expectStaticType<Exactly<void Function(int)>>();
  E.e1.instanceMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  E.e1.instanceMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  E.e1.instanceMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  E.e1.instanceMethod5.expectStaticType<Exactly<void Function(void)>>();
  E.e1.instanceMethod6.expectStaticType<Exactly<void Function(Never)>>();

  Ext.staticMethod1.expectStaticType<Exactly<void Function(int)>>();
  Ext.staticMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  Ext.staticMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  Ext.staticMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  Ext.staticMethod5.expectStaticType<Exactly<void Function(void)>>();
  Ext.staticMethod6.expectStaticType<Exactly<void Function(Never)>>();
  var a = A();
  a.instanceMethod1.expectStaticType<Exactly<void Function(int)>>();
  a.instanceMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  a.instanceMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  a.instanceMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  a.instanceMethod5.expectStaticType<Exactly<void Function(void)>>();
  a.instanceMethod6.expectStaticType<Exactly<void Function(Never)>>();

  ET.staticMethod1.expectStaticType<Exactly<void Function(int)>>();
  ET.staticMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  ET.staticMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  ET.staticMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  ET.staticMethod5.expectStaticType<Exactly<void Function(void)>>();
  ET.staticMethod6.expectStaticType<Exactly<void Function(Never)>>();
  var et = ET(0);
  et.instanceMethod1.expectStaticType<Exactly<void Function(int)>>();
  et.instanceMethod2.expectStaticType<Exactly<void Function([Object?])>>();
  et.instanceMethod3.expectStaticType<Exactly<void Function({dynamic v})>>();
  et.instanceMethod4.expectStaticType<Exactly<void Function({required Null v})>>();
  et.instanceMethod5.expectStaticType<Exactly<void Function(void)>>();
  et.instanceMethod6.expectStaticType<Exactly<void Function(Never)>>();
}
