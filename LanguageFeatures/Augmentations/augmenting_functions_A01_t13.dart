// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that it is not an error if an augmentation uses a
/// parameter whose type annotation uses an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
import 'augmentation_libraries_lib.dart';

part 'augmenting_functions_A01_t13_part.dart';

void topLevelFunction1(AL a);
void topLevelFunction2([AL? a]);
void topLevelFunction3({AL? a});
void topLevelFunction4({required AL a});

class C {
  static void staticMethod1(AL a);
  static void staticMethod2([AL? a]);
  static void staticMethod3({AL? a});
  static void staticMethod4({required AL a});
  void instanceMethod1(AL a);
  void instanceMethod2([AL? a]);
  void instanceMethod3({AL? a});
  void instanceMethod4({required AL a});
}

mixin M {
  static void staticMethod1(AL a);
  static void staticMethod2([AL? a]);
  static void staticMethod3({AL? a});
  static void staticMethod4({required AL a});
  void instanceMethod1(AL a);
  void instanceMethod2([AL? a]);
  void instanceMethod3({AL? a});
  void instanceMethod4({required AL a});
}

enum E {
  e1;

  static void staticMethod1(AL a);
  static void staticMethod2([AL? a]);
  static void staticMethod3({AL? a});
  static void staticMethod4({required AL a});
  void instanceMethod1(AL a);
  void instanceMethod2([AL? a]);
  void instanceMethod3({AL? a});
  void instanceMethod4({required AL a});
}

class A {}

extension Ext on A {
  static void staticMethod1(AL a);
  static void staticMethod2([AL? a]);
  static void staticMethod3({AL? a});
  static void staticMethod4({required AL a});
  void instanceMethod1(AL a);
  void instanceMethod2([AL? a]);
  void instanceMethod3({AL? a});
  void instanceMethod4({required AL a});
}

extension type ET(int _) {
  static void staticMethod1(AL a);
  static void staticMethod2([AL? a]);
  static void staticMethod3({AL? a});
  static void staticMethod4({required AL a});
  void instanceMethod1(AL a);
  void instanceMethod2([AL? a]);
  void instanceMethod3({AL? a});
  void instanceMethod4({required AL a});
}

class MA = Object with M;

main() {
  const a = AL();
  topLevelFunction1(a);
  topLevelFunction2(a);
  topLevelFunction3(a: a);
  topLevelFunction4(a: a);

  C.staticMethod1(a);
  C.staticMethod2(a);
  C.staticMethod3(a: a);
  C.staticMethod4(a: a);
  C().instanceMethod1(a);
  C().instanceMethod2(a);
  C().instanceMethod3(a: a);
  C().instanceMethod4(a: a);

  M.staticMethod1(a);
  M.staticMethod2(a);
  M.staticMethod3(a: a);
  M.staticMethod4(a: a);
  MA().instanceMethod1(a);
  MA().instanceMethod2(a);
  MA().instanceMethod3(a: a);
  MA().instanceMethod4(a: a);

  E.staticMethod1(a);
  E.staticMethod2(a);
  E.staticMethod3(a: a);
  E.staticMethod4(a: a);
  E.e1.instanceMethod1(a);
  E.e1.instanceMethod2(a);
  E.e1.instanceMethod3(a: a);
  E.e1.instanceMethod4(a: a);

  Ext.staticMethod1(a);
  Ext.staticMethod2(a);
  Ext.staticMethod3(a: a);
  Ext.staticMethod4(a: a);
  A().instanceMethod1(a);
  A().instanceMethod2(a);
  A().instanceMethod3(a: a);
  A().instanceMethod4(a: a);

  ET.staticMethod1(a);
  ET.staticMethod2(a);
  ET.staticMethod3(a: a);
  ET.staticMethod4(a: a);
  ET(0).instanceMethod1(a);
  ET(0).instanceMethod2(a);
  ET(0).instanceMethod3(a: a);
  ET(0).instanceMethod4(a: a);
}
