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
/// return type of an augmenting function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

int topLevelFunction1() => 0;
Object? topLevelFunction2() => 0;
void topLevelFunction3() {}
Null topLevelFunction4() => null;
dynamic topLevelFunction5() => "";
Never topLevelFunction6() => throw Exception();

augment topLevelFunction1();
augment topLevelFunction2();
augment topLevelFunction3();
augment topLevelFunction4();
augment topLevelFunction5();
augment topLevelFunction6();

class C {
  static int staticMethod1() => 0;
  static Object? staticMethod2() => 0;
  static void staticMethod3() {}
  static Null staticMethod4() => null;
  static dynamic staticMethod5() => "";
  static Never staticMethod6() => throw Exception();

  int instanceMethod1() => 0;
  Object? instanceMethod2() => 0;
  void instanceMethod3() {}
  Null instanceMethod4() => null;
  dynamic instanceMethod5() => "";
  Never instanceMethod6() => throw Exception();
}

augment class C {
  augment static staticMethod1();
  augment static staticMethod2();
  augment static staticMethod3();
  augment static staticMethod4();
  augment static staticMethod5();
  augment static staticMethod6();

  augment instanceMethod1();
  augment instanceMethod2();
  augment instanceMethod3();
  augment instanceMethod4();
  augment instanceMethod5();
  augment instanceMethod6();
}

mixin M {
  static int staticMethod1() => 0;
  static Object? staticMethod2() => 0;
  static void staticMethod3() {}
  static Null staticMethod4() => null;
  static dynamic staticMethod5() => "";
  static Never staticMethod6() => throw Exception();

  int instanceMethod1() => 0;
  Object? instanceMethod2() => 0;
  void instanceMethod3() {}
  Null instanceMethod4() => null;
  dynamic instanceMethod5() => "";
  Never instanceMethod6() => throw Exception();
}

augment mixin M {
  augment static staticMethod1();
  augment static staticMethod2();
  augment static staticMethod3();
  augment static staticMethod4();
  augment static staticMethod5();
  augment static staticMethod6();

  augment instanceMethod1();
  augment instanceMethod2();
  augment instanceMethod3();
  augment instanceMethod4();
  augment instanceMethod5();
  augment instanceMethod6();
}

enum E {
  e1;
  static int staticMethod1() => 0;
  static Object? staticMethod2() => 0;
  static void staticMethod3() {}
  static Null staticMethod4() => null;
  static dynamic staticMethod5() => "";
  static Never staticMethod6() => throw Exception();

  int instanceMethod1() => 0;
  Object? instanceMethod2() => 0;
  void instanceMethod3() {}
  Null instanceMethod4() => null;
  dynamic instanceMethod5() => "";
  Never instanceMethod6() => throw Exception();
}

augment enum E {
  ;
  augment static staticMethod1();
  augment static staticMethod2();
  augment static staticMethod3();
  augment static staticMethod4();
  augment static staticMethod5();
  augment static staticMethod6();

  augment instanceMethod1();
  augment instanceMethod2();
  augment instanceMethod3();
  augment instanceMethod4();
  augment instanceMethod5();
  augment instanceMethod6();
}

class A {}

extension Ext on A {
  static int staticMethod1() => 0;
  static Object? staticMethod2() => 0;
  static void staticMethod3() {}
  static Null staticMethod4() => null;
  static dynamic staticMethod5() => "";
  static Never staticMethod6() => throw Exception();

  int instanceMethod1() => 0;
  Object? instanceMethod2() => 0;
  void instanceMethod3() {}
  Null instanceMethod4() => null;
  dynamic instanceMethod5() => "";
  Never instanceMethod6() => throw Exception();
}

augment extension Ext {
  augment static staticMethod1();
  augment static staticMethod2();
  augment static staticMethod3();
  augment static staticMethod4();
  augment static staticMethod5();
  augment static staticMethod6();

  augment instanceMethod1();
  augment instanceMethod2();
  augment instanceMethod3();
  augment instanceMethod4();
  augment instanceMethod5();
  augment instanceMethod6();
}

extension type ET(int _) {
  static int staticMethod1() => 0;
  static Object? staticMethod2() => 0;
  static void staticMethod3() {}
  static Null staticMethod4() => null;
  static dynamic staticMethod5() => "";
  static Never staticMethod6() => throw Exception();

  int instanceMethod1() => 0;
  Object? instanceMethod2() => 0;
  void instanceMethod3() {}
  Null instanceMethod4() => null;
  dynamic instanceMethod5() => "";
  Never instanceMethod6() => throw Exception();
}

augment extension type ET {
  augment static staticMethod1();
  augment static staticMethod2();
  augment static staticMethod3();
  augment static staticMethod4();
  augment static staticMethod5();
  augment static staticMethod6();

  augment instanceMethod1();
  augment instanceMethod2();
  augment instanceMethod3();
  augment instanceMethod4();
  augment instanceMethod5();
  augment instanceMethod6();
}

class MA = Object with M;

main() {
  topLevelFunction1.expectStaticType<Exactly<int Function()>>();
  topLevelFunction2.expectStaticType<Exactly<Object? Function()>>();
  topLevelFunction3.expectStaticType<Exactly<void Function()>>();
  topLevelFunction4.expectStaticType<Exactly<Null Function()>>();
  topLevelFunction5.expectStaticType<Exactly<dynamic Function()>>();
  topLevelFunction6.expectStaticType<Exactly<Never Function()>>();

  C.staticMethod1.expectStaticType<Exactly<int Function()>>();
  C.staticMethod2.expectStaticType<Exactly<Object? Function()>>();
  C.staticMethod3.expectStaticType<Exactly<void Function()>>();
  C.staticMethod4.expectStaticType<Exactly<Null Function()>>();
  C.staticMethod5.expectStaticType<Exactly<dynamic Function()>>();
  C.staticMethod6.expectStaticType<Exactly<Never Function()>>();
  var c = C();
  c.instanceMethod1.expectStaticType<Exactly<int Function()>>();
  c.instanceMethod1.expectStaticType<Exactly<Object? Function()>>();
  c.instanceMethod1.expectStaticType<Exactly<void Function()>>();
  c.instanceMethod1.expectStaticType<Exactly<Null Function()>>();
  c.instanceMethod1.expectStaticType<Exactly<dynamic Function()>>();
  c.instanceMethod1.expectStaticType<Exactly<Never Function()>>();

  M.staticMethod1.expectStaticType<Exactly<int Function()>>();
  M.staticMethod2.expectStaticType<Exactly<Object? Function()>>();
  M.staticMethod3.expectStaticType<Exactly<void Function()>>();
  M.staticMethod4.expectStaticType<Exactly<Null Function()>>();
  M.staticMethod5.expectStaticType<Exactly<dynamic Function()>>();
  M.staticMethod6.expectStaticType<Exactly<Never Function()>>();
  var m = MA();
  m.instanceMethod1.expectStaticType<Exactly<int Function()>>();
  m.instanceMethod1.expectStaticType<Exactly<Object? Function()>>();
  m.instanceMethod1.expectStaticType<Exactly<void Function()>>();
  m.instanceMethod1.expectStaticType<Exactly<Null Function()>>();
  m.instanceMethod1.expectStaticType<Exactly<dynamic Function()>>();
  m.instanceMethod1.expectStaticType<Exactly<Never Function()>>();

  E.staticMethod1.expectStaticType<Exactly<int Function()>>();
  E.staticMethod2.expectStaticType<Exactly<Object? Function()>>();
  E.staticMethod3.expectStaticType<Exactly<void Function()>>();
  E.staticMethod4.expectStaticType<Exactly<Null Function()>>();
  E.staticMethod5.expectStaticType<Exactly<dynamic Function()>>();
  E.staticMethod6.expectStaticType<Exactly<Never Function()>>();

  E.e1.instanceMethod1.expectStaticType<Exactly<int Function()>>();
  E.e1.instanceMethod1.expectStaticType<Exactly<Object? Function()>>();
  E.e1.instanceMethod1.expectStaticType<Exactly<void Function()>>();
  E.e1.instanceMethod1.expectStaticType<Exactly<Null Function()>>();
  E.e1.instanceMethod1.expectStaticType<Exactly<dynamic Function()>>();
  E.e1.instanceMethod1.expectStaticType<Exactly<Never Function()>>();

  Ext.staticMethod1.expectStaticType<Exactly<int Function()>>();
  Ext.staticMethod2.expectStaticType<Exactly<Object? Function()>>();
  Ext.staticMethod3.expectStaticType<Exactly<void Function()>>();
  Ext.staticMethod4.expectStaticType<Exactly<Null Function()>>();
  Ext.staticMethod5.expectStaticType<Exactly<dynamic Function()>>();
  Ext.staticMethod6.expectStaticType<Exactly<Never Function()>>();
  var a = A();
  a.instanceMethod1.expectStaticType<Exactly<int Function()>>();
  a.instanceMethod1.expectStaticType<Exactly<Object? Function()>>();
  a.instanceMethod1.expectStaticType<Exactly<void Function()>>();
  a.instanceMethod1.expectStaticType<Exactly<Null Function()>>();
  a.instanceMethod1.expectStaticType<Exactly<dynamic Function()>>();
  a.instanceMethod1.expectStaticType<Exactly<Never Function()>>();

  ET.staticMethod1.expectStaticType<Exactly<int Function()>>();
  ET.staticMethod2.expectStaticType<Exactly<Object? Function()>>();
  ET.staticMethod3.expectStaticType<Exactly<void Function()>>();
  ET.staticMethod4.expectStaticType<Exactly<Null Function()>>();
  ET.staticMethod5.expectStaticType<Exactly<dynamic Function()>>();
  ET.staticMethod6.expectStaticType<Exactly<Never Function()>>();
  var et = ET(0);
  et.instanceMethod1.expectStaticType<Exactly<int Function()>>();
  et.instanceMethod1.expectStaticType<Exactly<Object? Function()>>();
  et.instanceMethod1.expectStaticType<Exactly<void Function()>>();
  et.instanceMethod1.expectStaticType<Exactly<Null Function()>>();
  et.instanceMethod1.expectStaticType<Exactly<dynamic Function()>>();
  et.instanceMethod1.expectStaticType<Exactly<Never Function()>>();
}
