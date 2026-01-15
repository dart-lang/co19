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
/// for a formal parameter type. Test functions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

void topLevelFunction(String v);

augment void topLevelFunction(v) {}

class C {
  static void staticMethod(String v);
  void instanceMethod(String v) {}
}

augment class C {
  augment static void staticMethod(v) {}
  augment void instanceMethod(v);
}

mixin M {
  static void staticMethod(String v);
  void instanceMethod(String v) {}
}

augment mixin M {
  augment static void staticMethod(v) {}
  augment void instanceMethod(v);
}

enum E {
  e0;
  static void staticMethod(String v);
  void instanceMethod(String v) {}
}

augment enum E {
  ;
  static void staticMethod(v) {}
  void instanceMethod(v);
}

class A {}

extension Ext on A {
  static void staticMethod(String v);
  void instanceMethod(String v) {}
}

augment extension Ext {
  static void staticMethod(v) {}
  void instanceMethod(v);
}

extension type ET(int _) {
  static void staticMethod(String v);
  void instanceMethod(String v) {}
}

augment extension type ET {
  static void staticMethod(v) {}
  void instanceMethod(v);
}

class MA = Object with M;

main() {
  topLevelFunction.expectStaticType<Exactly<void Function(String)>>();
  C.staticMethod.expectStaticType<Exactly<void Function(String)>>();
  C().instanceMethod.expectStaticType<Exactly<void Function(String)>>();
  M.staticMethod.expectStaticType<Exactly<void Function(String)>>();
  MA().instanceMethod.expectStaticType<Exactly<void Function(String)>>();
  E.staticMethod.expectStaticType<Exactly<void Function(String)>>();
  E.e0.instanceMethod.expectStaticType<Exactly<void Function(String)>>();
  Ext.staticMethod.expectStaticType<Exactly<void Function(String)>>();
  A().instanceMethod.expectStaticType<Exactly<void Function(String)>>();
  ET.staticMethod.expectStaticType<Exactly<void Function(String)>>();
  ET(0).instanceMethod.expectStaticType<Exactly<void Function(String)>>();
}
