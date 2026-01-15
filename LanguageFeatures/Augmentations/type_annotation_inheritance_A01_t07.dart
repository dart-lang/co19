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
/// @description Check that augmenting declaration may have no type annotations
/// for a formal parameter type. Test function with optional positioned and
/// named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

void topLevelFunction1({String v = ""});
augment void topLevelFunction1({v}) {}

void topLevelFunction2({required int v}) {}
augment void topLevelFunction2({required v});

void topLevelFunction3([String v = ""]);
augment void topLevelFunction3([v]) {}

class C {
  static void staticMethod1([String v = ""]);
  static void staticMethod2({String v = ""}) {}
  static void staticMethod3({required int v});
  void instanceMethod1([String v = ""]) {}
  void instanceMethod2({String v = ""});
  void instanceMethod3({required int v}) {}
}

augment class C {
  augment static void staticMethod1([v]) {}
  augment static void staticMethod2({v});
  augment static void staticMethod3({required v}) {}
  augment void instanceMethod1([v]);
  augment void instanceMethod2({v}) {}
  augment void instanceMethod3({required v});
}

mixin M {
  static void staticMethod1([String v = ""]);
  static void staticMethod2({String v = ""}) {}
  static void staticMethod3({required int v});
  void instanceMethod1([String v = ""]) {}
  void instanceMethod2({String v = ""});
  void instanceMethod3({required int v}) {}
}

augment mixin M {
  augment static void staticMethod1([v]) {}
  augment static void staticMethod2({v});
  augment static void staticMethod3({required v}) {}
  augment void instanceMethod1([v]);
  augment void instanceMethod2({v}) {}
  augment void instanceMethod3({required v});
}

enum E {
  e0;
  static void staticMethod1([String v = ""]);
  static void staticMethod2({String v = ""}) {}
  static void staticMethod3({required int v});
  void instanceMethod1([String v = ""]) {}
  void instanceMethod2({String v = ""});
  void instanceMethod3({required int v}) {}
}

augment enum E {
  ;
  augment static void staticMethod1([v]) {}
  augment static void staticMethod2({v});
  augment static void staticMethod3({required v}) {}
  augment void instanceMethod1([v]);
  augment void instanceMethod2({v}) {}
  augment void instanceMethod3({required v});
}

class A {}

extension Ext on A {
  static void staticMethod1([String v = ""]);
  static void staticMethod2({String v = ""}) {}
  static void staticMethod3({required int v});
  void instanceMethod1([String v = ""]) {}
  void instanceMethod2({String v = ""});
  void instanceMethod3({required int v}) {}
}

augment extension Ext {
  augment static void staticMethod1([v]) {}
  augment static void staticMethod2({v});
  augment static void staticMethod3({required v}) {}
  augment void instanceMethod1([v]);
  augment void instanceMethod2({v}) {}
  augment void instanceMethod3({required v});
}

extension type ET(int id) {
  static void staticMethod1([String v = ""]);
  static void staticMethod2({String v = ""}) {}
  static void staticMethod3({required int v});
  void instanceMethod1([String v = ""]) {}
  void instanceMethod2({String v = ""});
  void instanceMethod3({required int v}) {}
}

augment extension type ET {
  augment static void staticMethod1([v]) {}
  augment static void staticMethod2({v});
  augment static void staticMethod3({required v}) {}
  augment void instanceMethod1([v]);
  augment void instanceMethod2({v}) {}
  augment void instanceMethod3({required v});
}

class MA = Object with M;

main() {
  topLevelFunction1.expectStaticType<Exactly<void Function({String v})>>();
  topLevelFunction2.expectStaticType<Exactly<void Function({required int v})>>();
  topLevelFunction3.expectStaticType<Exactly<void Function([String])>>();

  C.staticMethod1.expectStaticType<Exactly<void Function([String v])>>();
  C.staticMethod2.expectStaticType<Exactly<void Function({String v})>>();
  C.staticMethod3.expectStaticType<Exactly<void Function({required int v})>>();
  C().instanceMethod1.expectStaticType<Exactly<void Function([String v])>>();
  C().instanceMethod2.expectStaticType<Exactly<void Function({String v})>>();
  C().instanceMethod3.expectStaticType<Exactly<void Function({required int v})>>();

  M.staticMethod1.expectStaticType<Exactly<void Function([String v])>>();
  M.staticMethod2.expectStaticType<Exactly<void Function({String v})>>();
  M.staticMethod3.expectStaticType<Exactly<void Function({required int v})>>();
  MA().instanceMethod1.expectStaticType<Exactly<void Function([String v])>>();
  MA().instanceMethod2.expectStaticType<Exactly<void Function({String v})>>();
  MA().instanceMethod3.expectStaticType<Exactly<void Function({required int v})>>();

  E.staticMethod1.expectStaticType<Exactly<void Function([String v])>>();
  E.staticMethod2.expectStaticType<Exactly<void Function({String v})>>();
  E.staticMethod3.expectStaticType<Exactly<void Function({required int v})>>();
  E.e0.instanceMethod1.expectStaticType<Exactly<void Function([String v])>>();
  E.e0.instanceMethod2.expectStaticType<Exactly<void Function({String v})>>();
  E.e0.instanceMethod3.expectStaticType<Exactly<void Function({required int v})>>();

  Ext.staticMethod1.expectStaticType<Exactly<void Function([String v])>>();
  Ext.staticMethod2.expectStaticType<Exactly<void Function({String v})>>();
  Ext.staticMethod3.expectStaticType<Exactly<void Function({required int v})>>();
  A().instanceMethod1.expectStaticType<Exactly<void Function([String v])>>();
  A().instanceMethod2.expectStaticType<Exactly<void Function({String v})>>();
  A().instanceMethod3.expectStaticType<Exactly<void Function({required int v})>>();

  ET.staticMethod1.expectStaticType<Exactly<void Function([String v])>>();
  ET.staticMethod2.expectStaticType<Exactly<void Function({String v})>>();
  ET.staticMethod3.expectStaticType<Exactly<void Function({required int v})>>();
  ET(0).instanceMethod1.expectStaticType<Exactly<void Function([String v])>>();
  ET(0).instanceMethod2.expectStaticType<Exactly<void Function({String v})>>();
  ET(0).instanceMethod3.expectStaticType<Exactly<void Function({required int v})>>();
}
