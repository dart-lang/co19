// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that it is not an error if an external function is
/// augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

const Meta = 1;

external String topLevelFunction1();
external String topLevelFunction2([int v]);
external String topLevelFunction3({int v});

augment @Meta topLevelFunction1();
augment @Meta String topLevelFunction2([v]);
augment @Meta topLevelFunction3({int v = 0});

class C {
  external static String staticMethod1();
  external static String staticMethod2([int v]);
  external static String staticMethod3({int v});

  external String instanceMethod1();
  external String instanceMethod2([int v]);
  external String instanceMethod3({int v});
}

augment class C {
  augment @Meta staticMethod1();
  augment @Meta String staticMethod2([v]);
  augment @Meta staticMethod3({int v = 0});

  augment @Meta instanceMethod1();
  augment @Meta String instanceMethod2([v = 0]);
  augment @Meta instanceMethod3({int v});
}

mixin M {
  external static String staticMethod1();
  external static String staticMethod2([int v]);
  external static String staticMethod3({int v});

  external String instanceMethod1();
  external String instanceMethod2([int v]);
  external String instanceMethod3({int v});
}

augment mixin M {
  augment @Meta staticMethod1();
  augment @Meta String staticMethod2([v]);
  augment @Meta staticMethod3({int v = 0});

  augment @Meta instanceMethod1();
  augment @Meta String instanceMethod2([v = 0]);
  augment @Meta instanceMethod3({int v});
}

enum E {
  e1;
  external static String staticMethod1();
  external static String staticMethod2([int v]);
  external static String staticMethod3({int v});

  external String instanceMethod1();
  external String instanceMethod2([int v]);
  external String instanceMethod3({int v});
}

augment enum E {
  ;
  augment @Meta staticMethod1();
  augment @Meta String staticMethod2([v]);
  augment @Meta staticMethod3({int v = 0});

  augment @Meta instanceMethod1();
  augment @Meta String instanceMethod2([v = 0]);
  augment @Meta instanceMethod3({int v});
}

class A {}

extension Ext on A {
  external static String staticMethod1();
  external static String staticMethod2([int v]);
  external static String staticMethod3({int v});

  external String instanceMethod1();
  external String instanceMethod2([int v]);
  external String instanceMethod3({int v});
}

augment extension Ext {
  augment @Meta staticMethod1();
  augment @Meta String staticMethod2([v]);
  augment @Meta staticMethod3({int v = 0});

  augment @Meta instanceMethod1();
  augment @Meta String instanceMethod2([v = 0]);
  augment @Meta instanceMethod3({int v});
}

extension type ET(int _) {
  external static String staticMethod1();
  external static String staticMethod2([int v]);
  external static String staticMethod3({int v});

  external String instanceMethod1();
  external String instanceMethod2([int v]);
  external String instanceMethod3({int v});
}

augment extension type ET {
  augment @Meta staticMethod1();
  augment @Meta String staticMethod2([v]);
  augment @Meta staticMethod3({int v = 0});

  augment @Meta instanceMethod1();
  augment @Meta String instanceMethod2([v = 0]);
  augment @Meta instanceMethod3({int v});
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
