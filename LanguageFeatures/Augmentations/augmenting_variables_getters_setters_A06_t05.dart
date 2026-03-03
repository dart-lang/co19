// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that a complete variable may be augmented by an abstract
/// variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int topLevelVariable = 0;
augment abstract int topLevelVariable;

class C {
  static int staticVariable = 0;
  int instanceVariable = 0;
}

augment class C {
  augment static abstract int staticVariable;
  augment abstract int instanceVariable;
}

mixin M {
  static int staticVariable = 0;
  int instanceVariable = 0;
}

augment mixin M {
  augment static abstract int staticVariable;
  augment abstract int instanceVariable;
}

enum E {
  e0;
  static int staticVariable = 0;
  final int instanceVariable = 0;
}

augment enum E {
  ;
  augment static abstract int staticVariable;
  augment abstract final int instanceVariable;
}

class A {}

extension Ext on A {
  static int staticVariable = 0;
}

augment extension Ext {
  augment static abstract int staticVariable;
}

extension type ET(int instanceVariable) {
  static int staticVariable = 0;
}

augment extension type ET {
  augment static abstract int staticVariable;
  augment abstract final int instanceVariable;
}

class MA = Object with M;

main() {
  Expect.equals(0, topLevelVariable);
  Expect.equals(0, C.staticVariable);
  Expect.equals(0, C().instanceVariable);
  Expect.equals(0, M.staticVariable);
  Expect.equals(0, MA().instanceVariable);
  Expect.equals(0, E.staticVariable);
  Expect.equals(0, Ext.staticVariable);
  Expect.equals(0, ET.staticVariable);
  Expect.equals(0, ET(0).instanceVariable);
}
