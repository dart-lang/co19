// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not final, or is late without an initializer,
/// then the variable declaration also implicitly defines a setter with a
/// parameter named `_` whose type is the type of the variable.
///
/// If the variable is `abstract`, then the getter and setter are incomplete,
/// otherwise they are complete. For non-abstract variables, the compiler
/// synthesizes a getter that accesses the backing storage and a setter that
/// updates it, so these members have bodies.
///
/// A getter can be augmented by another getter, and likewise a setter can be
/// augmented by a setter. This is true whether the getter or setter is
/// explicitly declared or implicitly declared using a variable declaration.
///
/// @description Checks that a `late` variable may be augmented with an
/// incomplete variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

late int topLevelVariable;
augment abstract int topLevelVariable;

class C {
  static late int staticVariable;
  late int instanceVariable;
}

augment class C {
  augment static abstract int staticVariable;
  augment abstract int instanceVariable;
}

mixin M {
  static late int staticVariable;
  late int instanceVariable;
}

augment mixin M {
  augment static abstract int staticVariable;
  augment abstract int instanceVariable;
}

enum E {
  e0;
  static late int staticVariable;
}

augment enum E {
  ;
  augment static abstract int staticVariable;
}

class A {}

extension Ext on A {
  static late int staticVariable;
}

augment extension Ext {
  augment static abstract int staticVariable;
}

extension type ET(int v) {
  static late int staticVariable;
}

augment extension type ET {
  augment static abstract int staticVariable;
}

class MA = Object with M;

main() {
  topLevelVariable = 1;
  Expect.equals(1, topLevelVariable);

  C.staticVariable = 1;
  Expect.equals(1, C.staticVariable);
  var c = C();
  c.instanceVariable = 1;
  Expect.equals(1, c.instanceVariable);

  M.staticVariable = 1;
  Expect.equals(1, M.staticVariable);
  var m = MA();
  m.instanceVariable = 1;
  Expect.equals(1, m.instanceVariable);

  E.staticVariable = 1;
  Expect.equals(1, E.staticVariable);
  Ext.staticVariable = 1;
  Expect.equals(1, Ext.staticVariable);
  ET.staticVariable = 1;
  Expect.equals(1, ET.staticVariable);
}
