// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, or instance method may be
/// augmented to provide default values for optional parameters.
/// ...
/// An optional formal parameter has the default value `d` if exactly one
/// declaration of that formal parameter in the augmentation chain specifies a
/// default value, and it is `d`. An optional formal parameter does not have an
/// explicitly specified default value if none of its declarations in the
/// augmentation chain specifies a default value. The default value is
/// introduced implicitly with the value `null` in the case where the parameter
/// has a nullable declared type, and no default values for that parameter are
/// specified in the augmentation chain.
///
/// @description Checks that an augmentation may provide default values for
/// optional parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int topLevelFunction1([int i]) => i;
int topLevelFunction2({int i}) => i;

augment int topLevelFunction1([int i = 1]);
augment int topLevelFunction2({int i = 2});

class C {
  static int staticMethod1([int i]) => i;
  static int staticMethod2({int i}) => i;
  int instanceMethod1([int i]) => i;
  int instanceMethod2([covariant int i]) => i;
  int instanceMethod3({int i}) => i;
  int instanceMethod4({covariant int i}) => i;
}

augment class C {
  augment static int staticMethod1([int i = 1]);
  augment static int staticMethod2({int i = 2});
  augment int instanceMethod1([int i = 3]);
  augment int instanceMethod2([covariant int i = 4]);
  augment int instanceMethod3({int i = 5});
  augment int instanceMethod4({covariant int i = 6});
}

mixin M {
  static int staticMethod1([int i]) => i;
  static int staticMethod2({int i}) => i;
  int instanceMethod1([int i]) => i;
  int instanceMethod2([covariant int i]) => i;
  int instanceMethod3({int i}) => i;
  int instanceMethod4({covariant int i}) => i;
}

augment mixin M {
  augment static int staticMethod1([int i = 1]);
  augment static int staticMethod2({int i = 2});
  augment int instanceMethod1([int i = 3]);
  augment int instanceMethod2([covariant int i = 4]);
  augment int instanceMethod3({int i = 5});
  augment int instanceMethod4({covariant int i = 6});
}

enum E {
  e1;
  static int staticMethod1([int i]) => i;
  static int staticMethod2({int i}) => i;
  int instanceMethod1([int i]) => i;
  int instanceMethod2([covariant int i]) => i;
  int instanceMethod3({int i}) => i;
  int instanceMethod4({covariant int i}) => i;
}

augment enum E {
  ;
  augment static int staticMethod1([int i = 1]);
  augment static int staticMethod2({int i = 2});
  augment int instanceMethod1([int i = 3]);
  augment int instanceMethod2([covariant int i = 4]);
  augment int instanceMethod3({int i = 5});
  augment int instanceMethod4({covariant int i = 6});
}

class A {}

extension Ext on A {
  static int staticMethod1([int i]) => i;
  static int staticMethod2({int i}) => i;
  int instanceMethod1([int i]) => i;
  int instanceMethod2([covariant int i]) => i;
  int instanceMethod3({int i}) => i;
  int instanceMethod4({covariant int i}) => i;
}

augment extension Ext {
  augment static int staticMethod1([int i = 1]);
  augment static int staticMethod2({int i = 2});
  augment int instanceMethod1([int i = 3]);
  augment int instanceMethod2([covariant int i = 4]);
  augment int instanceMethod3({int i = 5});
  augment int instanceMethod4({covariant int i = 6});
}

extension type ET(int _) {
  static int staticMethod1([int i]) => i;
  static int staticMethod2({int i}) => i;
  int instanceMethod1([int i]) => i;
  int instanceMethod2([covariant int i]) => i;
  int instanceMethod3({int i}) => i;
  int instanceMethod4({covariant int i}) => i;
}

augment extension type ET {
  augment static int staticMethod1([int i = 1]);
  augment static int staticMethod2({int i = 2});
  augment int instanceMethod1([int i = 3]);
  augment int instanceMethod2([covariant int i = 4]);
  augment int instanceMethod3({int i = 5});
  augment int instanceMethod4({covariant int i = 6});
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelFunction1());
  Expect.equals(2, topLevelFunction2());

  Expect.equals(1, C.staticMethod1());
  Expect.equals(2, C.staticMethod2());
  Expect.equals(3, C().instanceMethod1());
  Expect.equals(4, C().instanceMethod2());
  Expect.equals(5, C().instanceMethod3());
  Expect.equals(6, C().instanceMethod4());

  Expect.equals(1, M.staticMethod1());
  Expect.equals(2, M.staticMethod2());
  Expect.equals(3, MA().instanceMethod1());
  Expect.equals(4, MA().instanceMethod2());
  Expect.equals(5, MA().instanceMethod3());
  Expect.equals(6, MA().instanceMethod4());

  Expect.equals(1, E.staticMethod1());
  Expect.equals(2, E.staticMethod2());
  Expect.equals(3, E.e1.instanceMethod1());
  Expect.equals(4, E.e1.instanceMethod2());
  Expect.equals(5, E.e1.instanceMethod3());
  Expect.equals(6, E.e1.instanceMethod4());

  Expect.equals(1, Ext.staticMethod1());
  Expect.equals(2, Ext.staticMethod2());
  Expect.equals(3, A().e1.instanceMethod1());
  Expect.equals(4, A().e1.instanceMethod2());
  Expect.equals(5, A().e1.instanceMethod3());
  Expect.equals(6, A().e1.instanceMethod4());

  Expect.equals(1, ET.staticMethod1());
  Expect.equals(2, ET.staticMethod2());
  Expect.equals(3, ET(0).e1.instanceMethod1());
  Expect.equals(4, ET(0).e1.instanceMethod2());
  Expect.equals(5, ET(0).e1.instanceMethod3());
  Expect.equals(6, ET(0).e1.instanceMethod4());
}
