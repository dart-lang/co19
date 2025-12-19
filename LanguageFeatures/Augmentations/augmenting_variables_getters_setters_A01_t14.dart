// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not `final`, or is `late` without an
/// initializer, then the variable declaration also implicitly defines a setter
/// with a parameter named `_` whose type is the type of the variable.
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
/// @description Checks that an incomplete getter may be augmented by a
/// `late final` variable with an initializing expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int get topLevelGetter;
augment late final int topLevelGetter = 1;

class C {
  static int get staticGetter;
  int get instanceGetter;
}

augment class C {
  augment static late final int staticGetter = 2;
  augment late final int instanceGetter = 3;
}

mixin M {
  static int get staticGetter;
  int get instanceGetter;
}

augment mixin M {
  augment static late final int staticGetter = 4;
  augment late final int instanceGetter = 5;
}

enum E {
  e0;
  static int get staticGetter;
  int get instanceGetter;
}

augment enum E {
  ;
  augment static late final int staticGetter = 6;
  augment late final int instanceGetter = 7;
}

class A {}

extension Ext on A {
  static int get staticGetter;
  int get instanceGetter;
}

augment extension Ext {
  augment static late final int staticGetter = 8;
  augment late final int instanceGetter = 9;
}

extension type ET(int _) {
  static int get staticGetter;
  int get instanceGetter;
}

augment extension type ET {
  augment static late final int staticGetter = 10;
  augment late final int instanceGetter = 11;
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelGetter);
  Expect.equals(2, C.staticGetter);
  Expect.equals(3, C().instanceGetter);
  Expect.equals(4, M.staticGetter);
  Expect.equals(5, MA().instanceGetter);
  Expect.equals(6, E.staticGetter);
  Expect.equals(7, E.e0.instanceGetter);
  Expect.equals(8, Ext.staticGetter);
  Expect.equals(9, A().instanceGetter);
  Expect.equals(10, ET.staticGetter);
  Expect.equals(11, ET(0).instanceGetter);
}
