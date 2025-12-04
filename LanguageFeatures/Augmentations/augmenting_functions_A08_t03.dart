// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - A function is not complete after all augmentations are applied, unless
///   it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is not an error if a function is make complete
/// by an augmentation by adding an `external` modifier.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

String topLevelFunction1();
String topLevelFunction2([int v]);
String topLevelFunction3({int v});

augment external topLevelFunction1();
augment external String topLevelFunction2([v]);
augment external topLevelFunction3({int v = 0});

class C {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment class C {
  augment external staticMethod1();
  augment external String staticMethod2([v]);
  augment external staticMethod3({int v = 0});

  augment external instanceMethod1();
  augment external String instanceMethod2([v]);
  augment external instanceMethod3({int v = 0});
}

mixin M {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment mixin M {
  augment external staticMethod1();
  augment external String staticMethod2([v]);
  augment external staticMethod3({int v = 0});

  augment external instanceMethod1();
  augment external String instanceMethod2([v]);
  augment external instanceMethod3({int v = 0});
}

enum E {
  e1;
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment enum E {
  ;
  augment external staticMethod1();
  augment external String staticMethod2([v]);
  augment external staticMethod3({int v = 0});

  augment external instanceMethod1();
  augment external String instanceMethod2([v]);
  augment external instanceMethod3({int v = 0});
}

class A {}

extension Ext on A {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment extension Ext {
  augment external staticMethod1();
  augment external String staticMethod2([v]);
  augment external staticMethod3({int v = 0});

  augment external instanceMethod1();
  augment external String instanceMethod2([v]);
  augment external instanceMethod3({int v = 0});
}

extension type ET(int _) {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment extension type ET {
  augment external staticMethod1();
  augment external String staticMethod2([v]);
  augment external staticMethod3({int v = 0});

  augment external instanceMethod1();
  augment external String instanceMethod2([v]);
  augment external instanceMethod3({int v = 0});
}

class MA = Object with M;

main() {
  topLevelFunction1.expectStaticType<Exactly<String Function()>>();
  topLevelFunction2.expectStaticType<Exactly<String Function([int])>>();
  topLevelFunction3.expectStaticType<Exactly<String Function({int v})>>();

  C.staticMethod1.expectStaticType<Exactly<String Function()>>();
  C.staticMethod2.expectStaticType<Exactly<String Function([int])>>();
  C.staticMethod3.expectStaticType<Exactly<String Function({int v})>>();
  C().instanceMethod1.expectStaticType<Exactly<String Function()>>();
  C().instanceMethod2.expectStaticType<Exactly<String Function([int])>>();
  C().instanceMethod3.expectStaticType<Exactly<String Function({int v})>>();

  M.staticMethod1.expectStaticType<Exactly<String Function()>>();
  M.staticMethod2.expectStaticType<Exactly<String Function([int])>>();
  M.staticMethod3.expectStaticType<Exactly<String Function({int v})>>();
  MA().instanceMethod1.expectStaticType<Exactly<String Function()>>();
  MA().instanceMethod2.expectStaticType<Exactly<String Function([int])>>();
  MA().instanceMethod3.expectStaticType<Exactly<String Function({int v})>>();

  E.staticMethod1.expectStaticType<Exactly<String Function()>>();
  E.staticMethod2.expectStaticType<Exactly<String Function([int])>>();
  E.staticMethod3.expectStaticType<Exactly<String Function({int v})>>();
  E.e1.instanceMethod1.expectStaticType<Exactly<String Function()>>();
  E.e1.instanceMethod2.expectStaticType<Exactly<String Function([int])>>();
  E.e1.instanceMethod3.expectStaticType<Exactly<String Function({int v})>>();

  Ext.staticMethod1.expectStaticType<Exactly<String Function()>>();
  Ext.staticMethod2.expectStaticType<Exactly<String Function([int])>>();
  Ext.staticMethod3.expectStaticType<Exactly<String Function({int v})>>();
  A().instanceMethod1.expectStaticType<Exactly<String Function()>>();
  A().instanceMethod2.expectStaticType<Exactly<String Function([int])>>();
  A().instanceMethod3.expectStaticType<Exactly<String Function({int v})>>();

  ET.staticMethod1.expectStaticType<Exactly<String Function()>>();
  ET.staticMethod2.expectStaticType<Exactly<String Function([int])>>();
  ET.staticMethod3.expectStaticType<Exactly<String Function({int v})>>();
  ET(0).instanceMethod1.expectStaticType<Exactly<String Function()>>();
  ET(0).instanceMethod2.expectStaticType<Exactly<String Function([int])>>();
  ET(0).instanceMethod3.expectStaticType<Exactly<String Function({int v})>>();
}
