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
/// @description Checks that a getter may be augmented by an implicitly defined
/// augmenting getter (abstract variable).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String get topLevelGetter => "x";
augment abstract String topLevelGetter;

class C {
  static String get staticGetter => "x";
  augment static abstract String staticGetter;

  String get instanceGetter => "x";
  augment abstract String instanceGetter;
}

mixin M {
  static String get staticGetter => "x";
  augment static abstract String staticGetter;

  String get instanceGetter => "x";
  augment abstract String instanceGetter;
}

enum E {
  e0;
  static String get staticGetter => "x";
  augment static abstract String staticGetter;

  String get instanceGetter => "x";
  augment abstract String instanceGetter;
}

class A {}

extension Ext on A {
  static String get staticGetter => "x";
  augment static abstract String staticGetter;

  String get instanceGetter => "x";
  augment abstract String instanceGetter;
}

extension type ET(int _) {
  static String get staticGetter => "x";
  augment static abstract String staticGetter;

  String get instanceGetter => "x";
  augment abstract String instanceGetter;
}

class MA = Object with M;

main() {
  Expect.equals("x", topLevelGetter);
  Expect.equals("x", C.staticGetter);
  Expect.equals("x", C().instanceGetter);
  Expect.equals("x", M.staticGetter);
  Expect.equals("x", MA().instanceGetter);
  Expect.equals("x", E.staticGetter);
  Expect.equals("x", E.e0.instanceGetter);
  Expect.equals("x", Ext.staticGetter);
  Expect.equals("x", A().instanceGetter);
  Expect.equals("x", ET.staticGetter);
  Expect.equals("x", ET(0).instanceGetter);
}
