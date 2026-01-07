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
/// @description Checks that an incomplete setter may be made complete by an
/// implicitly defined augmenting setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

void set topLevelSetter(String v);
String get topLevelSetter; // Avoid an error at the augmenting declaration.
augment String topLevelSetter = "x";

class C {
  static void set staticSetter(String _);
  static String get staticSetter;
  void set instanceSetter(String v);
  String get instanceSetter;
}

augment class C {
  augment static String staticSetter = "x";
  augment String instanceSetter = "x";
}

mixin M {
  static void set staticSetter(String _);
  static String get staticSetter;
  void set instanceSetter(String v);
  String get instanceSetter;
}

augment mixin M {
  augment static String staticSetter = "x";
  augment String instanceSetter = "x";
}

enum E {
  e0;
  static void set staticSetter(String _);
  static String get staticSetter;
  void set instanceSetter(String v);
  String get instanceSetter;
}

augment enum E {
  ;
  augment static String staticSetter = "x";
  augment String instanceSetter = "x";
}

class A {}

extension Ext on A {
  static void set staticSetter(String _);
  static String get staticSetter;
  void set instanceSetter(String v);
  String get instanceSetter;
}

augment extension Ext {
  augment static String staticSetter = "x";
  augment String instanceSetter = "x";
}

extension type ET(int _) {
  static void set staticSetter(String _);
  static String get staticSetter;
  void set instanceSetter(String v);
  String get instanceSetter;
}

augment extension type ET {
  augment static String staticSetter = "x";
  augment String instanceSetter = "x";
}

class MA = Object with M;

main() {
  topLevelSetter = "a";
  Expect.equals("a", topLevelSetter); // Augmentation also adds a getter

  C.staticSetter = "b";
  Expect.equals("b", C.staticSetter);
  var c = C();
  c.instanceSetter = "c";
  Expect.equals("c", c.instanceSetter);

  M.staticSetter = "d";
  Expect.equals("d", M.staticSetter);
  var m = MA();
  m.instanceSetter = "e";
  Expect.equals("e", m.instanceSetter);

  E.staticSetter = "f";
  Expect.equals("f", E.staticSetter);
  E.e0.instanceSetter = "g";
  Expect.equals("g", E.e0.instanceSetter);

  Ext.staticSetter = "h";
  Expect.equals("h", Ext.staticSetter);
  var a = A();
  a.instanceSetter = "i";
  Expect.equals("i", a.instanceSetter);

  ET.staticSetter = "j";
  Expect.equals("j", ET.staticSetter);
  var et = ET(0);
  et.instanceSetter = "k";
  Expect.equals("k", et.instanceSetter);
}
