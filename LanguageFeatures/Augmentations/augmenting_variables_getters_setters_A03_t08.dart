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
/// @description Checks that it's not an error if an implicit augmenting setter
/// omits a type annotation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

void set topLevelSetter(String _);
String get topLevelSetter; // Avoid an error at the augmenting declaration.
augment var topLevelSetter = "x";

class C {
  static void set staticSetter(String _);
  void set instanceSetter(String v);
}

augment class C {
  augment static var staticSetter = "x";
  augment var instanceSetter = "x";
}

mixin M {
  static void set staticSetter(String v);
  void set instanceSetter(String _);
}

augment mixin M {
  augment static var staticSetter = "x";
  augment var instanceSetter = "x";
}

enum E {
  e0;
  static void set staticSetter(String _);
  void set instanceSetter(String v);
}

augment enum E {
  ;
  augment static var staticSetter = "x";
  augment var instanceSetter = "x";
}

class A {}

extension Ext on A {
  static void set staticSetter(String v);
  void set instanceSetter(String _);
}

augment extension Ext {
  augment static var staticSetter = "x";
  augment var instanceSetter = "x";
}

extension type ET(int _) {
  static void set staticSetter(String _);
  void set instanceSetter(String v);
}

augment extension type ET {
  augment static var staticSetter = "x";
  augment var instanceSetter = "x";
}

class MA = Object with M;

main() {
  Expect.equals("x", topLevelSetter); // Augmentation also adds a getter
  Expect.equals("x", C.staticSetter);
  Expect.equals("x", C().instanceSetter);
  Expect.equals("x", M.staticSetter);
  Expect.equals("x", MA().instanceSetter);
  Expect.equals("x", E.staticSetter);
  Expect.equals("x", E.e0.instanceSetter);
  Expect.equals("x", Ext.staticSetter);
  Expect.equals("x", A().instanceSetter);
  Expect.equals("x", ET.staticSetter);
  Expect.equals("x", ET(0).instanceSetter);
}
