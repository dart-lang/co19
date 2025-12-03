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
/// @description Checks that it is not an error if a function augmentation
/// doesn't specify default values for optional parameters. In this case the
/// default value is `null` if the parameter has a nullable declared type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int? topLevelFunction1([int? i]) => i;
int? topLevelFunction2({int? i}) => i;
topLevelFunction3({i}) => i;
topLevelFunction4({i}) => i;

class C {
  static int? staticMethod1([int? i]) => i;
  static int? staticMethod2({int? i}) => i;
  static staticMethod3([i]) => i;
  static staticMethod4({i}) => i;
  int? instanceMethod1([int? i]) => i;
  int? instanceMethod2([covariant int? i]) => i;
  int? instanceMethod3({int? i}) => i;
  int? instanceMethod4({covariant int? i}) => i;
  instanceMethod5([i]) => i;
  instanceMethod6({i}) => i;
}

augment class C {
  augment static int? staticMethod1([int? i]);
  augment static int? staticMethod2({int? i});
  augment static staticMethod3([i]);
  augment static staticMethod4({i});
  augment int? instanceMethod1([int? i]);
  augment int? instanceMethod2([covariant int? i]);
  augment int? instanceMethod3({int? i});
  augment int? instanceMethod4({covariant int? i});
  augment instanceMethod5([i]);
  augment instanceMethod6({i});
}

mixin M {
  static int? staticMethod1([int? i]) => i;
  static int? staticMethod2({int? i}) => i;
  static staticMethod3([i]) => i;
  static staticMethod4({i}) => i;
  int? instanceMethod1([int? i]) => i;
  int? instanceMethod2([covariant int? i]) => i;
  int? instanceMethod3({int? i}) => i;
  int? instanceMethod4({covariant int? i}) => i;
  instanceMethod5([i]) => i;
  instanceMethod6({i}) => i;
}

augment mixin M {
  augment static int? staticMethod1([int? i]);
  augment static int? staticMethod2({int? i});
  augment static staticMethod3([i]);
  augment static staticMethod4({i});
  augment int? instanceMethod1([int? i]);
  augment int? instanceMethod2([covariant int? i]);
  augment int? instanceMethod3({int? i});
  augment int? instanceMethod4({covariant int? i});
  augment instanceMethod5([i]);
  augment instanceMethod6({i});
}

enum E {
  e1;
  static int? staticMethod1([int? i]) => i;
  static int? staticMethod2({int? i}) => i;
  static staticMethod3([i]) => i;
  static staticMethod4({i}) => i;
  int? instanceMethod1([int? i]) => i;
  int? instanceMethod2([covariant int? i]) => i;
  int? instanceMethod3({int? i}) => i;
  int? instanceMethod4({covariant int? i}) => i;
  instanceMethod5([i]) => i;
  instanceMethod6({i}) => i;
}

augment enum E {
  ;
  augment static int? staticMethod1([int? i]);
  augment static int? staticMethod2({int? i});
  augment static staticMethod3([i]);
  augment static staticMethod4({i});
  augment int? instanceMethod1([int? i]);
  augment int? instanceMethod2([covariant int? i]);
  augment int? instanceMethod3({int? i});
  augment int? instanceMethod4({covariant int? i});
  augment instanceMethod5([i]);
  augment instanceMethod6({i});
}

class A {}

extension Ext on A {
  static int? staticMethod1([int? i]) => i;
  static int? staticMethod2({int? i}) => i;
  static staticMethod3([i]) => i;
  static staticMethod4({i}) => i;
  int? instanceMethod1([int? i]) => i;
  int? instanceMethod2([covariant int? i]) => i;
  int? instanceMethod3({int? i}) => i;
  int? instanceMethod4({covariant int? i}) => i;
  instanceMethod5([i]) => i;
  instanceMethod6({i}) => i;
}

augment extension Ext {
  augment static int? staticMethod1([int? i]);
  augment static int? staticMethod2({int? i});
  augment static staticMethod3([i]);
  augment static staticMethod4({i});
  augment int? instanceMethod1([int? i]);
  augment int? instanceMethod2([covariant int? i]);
  augment int? instanceMethod3({int? i});
  augment int? instanceMethod4({covariant int? i});
  augment instanceMethod5([i]);
  augment instanceMethod6({i});
}

extension type ET(int _) {
  static int? staticMethod1([int? i]) => i;
  static int? staticMethod2({int? i}) => i;
  static staticMethod3([i]) => i;
  static staticMethod4({i}) => i;
  int? instanceMethod1([int? i]) => i;
  int? instanceMethod2([covariant int? i]) => i;
  int? instanceMethod3({int? i}) => i;
  int? instanceMethod4({covariant int? i}) => i;
  instanceMethod5([i]) => i;
  instanceMethod6({i}) => i;
}

augment extension type ET {
  augment static int? staticMethod1([int? i]);
  augment static int? staticMethod2({int? i});
  augment static staticMethod3([i]);
  augment static staticMethod4({i});
  augment int? instanceMethod1([int? i]);
  augment int? instanceMethod2([covariant int? i]);
  augment int? instanceMethod3({int? i});
  augment int? instanceMethod4({covariant int? i});
  augment instanceMethod5([i]);
  augment instanceMethod6({i});
}

class MA = Object with M;

main() {
  Expect.isNull(topLevelFunction1());
  Expect.isNull(topLevelFunction2());
  Expect.isNull(topLevelFunction3());
  Expect.isNull(topLevelFunction4());

  Expect.isNull(C.staticMethod1());
  Expect.isNull(C.staticMethod2());
  Expect.isNull(C.staticMethod3());
  Expect.isNull(C.staticMethod4());
  Expect.isNull(C().instanceMethod1());
  Expect.isNull(C().instanceMethod2());
  Expect.isNull(C().instanceMethod3());
  Expect.isNull(C().instanceMethod4());
  Expect.isNull(C().instanceMethod5());
  Expect.isNull(C().instanceMethod6());

  Expect.isNull(M.staticMethod1());
  Expect.isNull(M.staticMethod2());
  Expect.isNull(M.staticMethod3());
  Expect.isNull(M.staticMethod4());
  Expect.isNull(MA().instanceMethod1());
  Expect.isNull(MA().instanceMethod2());
  Expect.isNull(MA().instanceMethod3());
  Expect.isNull(MA().instanceMethod4());
  Expect.isNull(MA().instanceMethod5());
  Expect.isNull(MA().instanceMethod6());

  Expect.isNull(E.staticMethod1());
  Expect.isNull(E.staticMethod2());
  Expect.isNull(E.staticMethod3());
  Expect.isNull(E.staticMethod4());
  Expect.isNull(E.e1.instanceMethod1());
  Expect.isNull(E.e1.instanceMethod2());
  Expect.isNull(E.e1.instanceMethod3());
  Expect.isNull(E.e1.instanceMethod4());
  Expect.isNull(E.e1.instanceMethod5());
  Expect.isNull(E.e1.instanceMethod6());

  Expect.isNull(Ext.staticMethod1());
  Expect.isNull(Ext.staticMethod2());
  Expect.isNull(Ext.staticMethod3());
  Expect.isNull(Ext.staticMethod4());
  Expect.isNull(A().instanceMethod1());
  Expect.isNull(A().instanceMethod2());
  Expect.isNull(A().instanceMethod3());
  Expect.isNull(A().instanceMethod4());
  Expect.isNull(A().instanceMethod5());
  Expect.isNull(A().instanceMethod6());

  Expect.isNull(ET.staticMethod1());
  Expect.isNull(ET.staticMethod2());
  Expect.isNull(ET.staticMethod3());
  Expect.isNull(ET.staticMethod4());
  Expect.isNull(ET(0).instanceMethod1());
  Expect.isNull(ET(0).instanceMethod2());
  Expect.isNull(ET(0).instanceMethod3());
  Expect.isNull(ET(0).instanceMethod4());
  Expect.isNull(ET(0).instanceMethod5());
  Expect.isNull(ET(0).instanceMethod6());
}
