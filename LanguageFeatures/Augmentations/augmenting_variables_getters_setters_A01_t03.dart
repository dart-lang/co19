// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not final, or is late without an initializer,
/// then the variable declaration also implicitly defines a setter with a
/// parameter named `_` whose type is the type of the variable.
///
/// If the variable is abstract, then the getter and setter are incomplete,
/// otherwise they are complete. For non-abstract variables, the compiler
/// synthesizes a getter that accesses the backing storage and a setter that
/// updates it, so these members have bodies.
///
/// A getter can be augmented by another getter, and likewise a setter can be
/// augmented by a setter. This is true whether the getter or setter is
/// explicitly declared or implicitly declared using a variable declaration.
///
/// @description Checks that a non-abstract variable may be augmented by an
/// augmenting getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String topLevelVariable = "x";
augment String get topLevelVariable;

class C {
  static String staticVariable = "x";
  final String instanceVariable = "x";
}

augment class C {
  augment static String get staticVariable;
  augment String get instanceVariable;
}

mixin M {
  static final String staticVariable = "x";
  String instanceVariable = "x";
}

augment mixin M {
  augment static String get staticVariable;
  augment String get instanceVariable;
}

enum E {
  e0;
  static String staticVariable = "x";
  final String instanceVariable = "x";
}

augment enum E {
  ;
  augment static String get staticVariable;
  augment String get instanceVariable;
}

class A {}

extension Ext on A {
  static String staticVariable = "x";
}

augment extension Ext {
  augment static String get staticVariable;
}

extension type ET(int _) {
  static String staticVariable = "x";
}

augment extension type ET {
  augment static String get staticVariable;
}

class MA = Object with M;

main() {
  Expect.equals("x", topLevelVariable);
  Expect.equals("x", C.staticVariable);
  Expect.equals("x", C().instanceVariable);
  Expect.equals("x", M.staticVariable);
  Expect.equals("x", MA().instanceVariable);
  Expect.equals("x", E.staticVariable);
  Expect.equals("x", E.e0.instanceVariable);
  Expect.equals("x", Ext.staticVariable);
  Expect.equals("x", ET.staticVariable);
}
