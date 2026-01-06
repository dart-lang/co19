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
/// @description Checks that an incomplete setter may be augmented by a
/// `late final` variable with no initializer;
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

void set topLevelSetter(int _);
int get topLevelSetter; // Avoid an error at the augmenting declaration
augment late final int topLevelSetter;

class C {
  static void set staticSetter(int _);
  static int get staticSetter;
  void set instanceSetter(int _);
  int get instanceSetter;
}

augment class C {
  augment static late final int staticSetter;
  augment late final int instanceSetter;
}

mixin M {
  static void set staticSetter(int _);
  static int get staticSetter;
  void set instanceSetter(int _);
  int get instanceSetter;
}

augment mixin M {
  augment static late final int staticSetter;
  augment late final int instanceSetter;
}

enum E {
  e0;
  static void set staticSetter(int _);
  static int get staticSetter;
  void set instanceSetter(int _);
  int get instanceSetter;
}

augment enum E {
  ;
  augment static late final int staticSetter;
  augment late final int instanceSetter;
}

class A {}

extension Ext on A {
  static void set staticSetter(int _);
  static int get staticSetter;
  void set instanceSetter(int _);
  int get instanceSetter;
}

augment extension Ext {
  augment static late final int staticSetter;
  augment late final int instanceSetter;
}

extension type ET(int _) {
  static void set staticSetter(int _);
  static int get staticSetter;
  void set instanceSetter(int _);
  int get instanceSetter;
}

augment extension type ET {
  augment static late final int staticSetter;
  augment late final int instanceSetter;
}

class MA = Object with M;

main() {
  topLevelSetter = 1;
  Expect.equals(1, topLevelSetter);

  C.staticSetter = 2;
  Expect.equals(2, C.staticSetter);
  var c = C();
  c.instanceSetter = 3;
  Expect.equals(3, c.instanceSetter);

  M.staticSetter = 4;
  Expect.equals(4, M.staticSetter);
  var m = MA();
  m.instanceSetter = 5;
  Expect.equals(5, m.instanceSetter);

  E.staticSetter = 6;
  Expect.equals(6, E.staticSetter);
  E.e0.instanceSetter = 7;
  Expect.equals(7, E.e0.instanceSetter);

  Ext.staticSetter = 8;
  Expect.equals(8, Ext.staticSetter);
  var a = A();
  a.instanceSetter = 9;
  Expect.equals(9, a.instanceSetter);

  ET.staticSetter = 10;
  Expect.equals(10, ET.staticSetter);
  var et = ET(0);
  et.instanceSetter = 11;
  Expect.equals(11, et.instanceSetter);
}
