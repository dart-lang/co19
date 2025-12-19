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
/// @description Checks that a `late` but not `final` variable may be augmented
/// by a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

late int topLevelVariable;
augment void set topLevelVariable(int _);

class C {
  static late int staticVariable;
  late int instanceVariable;
}

augment class C {
  augment static void set staticVariable(int _);
  augment void set instanceVariable(String _);
}

mixin M {
  static late int staticVariable;
  late int instanceVariable;
}

augment mixin M {
  augment static void set staticVariable(int _);
  augment void set instanceVariable(String _);
}

enum E {
  e0;
  static late int staticVariable;
}

augment enum E {
  ;
  augment static void set staticVariable(int _);
}

class A {}

extension Ext on A {
  static late int staticVariable;
}

augment extension Ext {
  augment static void set staticVariable(int _);
}

extension type ET(int _) {
  static late int staticVariable;
}

augment extension type ET {
  augment static void set staticVariable(int _);
}

class MA = Object with M;

main() {
  topLevelVariable = 1;
  Expect.equals(1, topLevelVariable);

  C.staticVariable = 2;
  Expect.equals(2, C.staticVariable);
  var c = C();
  c.instanceVariable = 3;
  Expect.equals(3, c.instanceVariable);

  M.staticVariable = 4;
  Expect.equals(4, M.staticVariable);
  var m = MA();
  m.instanceVariable = 5;
  Expect.equals(5, m.instanceVariable);

  E.staticVariable = 6;
  Expect.equals(6, E.staticVariable);

  Ext.staticVariable = 7;
  Expect.equals(7, Ext.staticVariable);

  ET.staticVariable = 8;
  Expect.equals(8, ET.staticVariable);
}
