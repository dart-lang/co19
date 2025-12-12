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
/// @description Checks that it's not an error if an implicit augmenting getter
/// omits type annotation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String get topLevelGetter1;
augment var topLevelGetter1 = "x";

String get topLevelGetter2 => "x";
augment final topLevelGetter2;

class C {
  static String get staticGetter1;
  static String get staticGetter2 => "x";
  String get instanceGetter1;
  String get instanceGetter2 => "x";
}

augment class C {
  augment static var staticGetter1 = "x";
  augment static final staticGetter2;
  augment var instanceGetter1 = "x";
  augment final instanceGetter2;
}

mixin M {
  static String get staticGetter1;
  static String get staticGetter2 => "x";
  String get instanceGetter1;
  String get instanceGetter2 => "x";
}

augment mixin M {
  augment static var staticGetter1 = "x";
  augment static final staticGetter2;
  augment var instanceGetter1 = "x";
  augment final instanceGetter2;
}

enum E {
  e0;
  static String get staticGetter1;
  static String get staticGetter2 => "x";
  String get instanceGetter1;
  String get instanceGetter2 => "x";
}

augment enum E {
  ;
  augment static var staticGetter1 = "x";
  augment static final staticGetter2;
  augment var instanceGetter1 = "x";
  augment final instanceGetter2;
}

class A {}

extension Ext on A {
  static String get staticGetter1;
  static String get staticGetter2 => "x";
  String get instanceGetter1;
  String get instanceGetter2 => "x";
}

augment extension Ext {
  augment static var staticGetter1 = "x";
  augment static final staticGetter2;
  augment var instanceGetter1 = "x";
  augment final instanceGetter2;
}

extension type ET(int _) {
  static String get staticGetter1;
  static String get staticGetter2 => "x";
  String get instanceGetter1;
  String get instanceGetter2 => "x";
}

augment extension type ET {
  augment static var staticGetter1 = "x";
  augment static final staticGetter2;
  augment var instanceGetter1 = "x";
  augment final instanceGetter2;
}

class MA = Object with M;

main() {
  Expect.equals("x", topLevelGetter1);
  Expect.equals("x", topLevelGetter2);
  Expect.equals("x", C.staticGetter1);
  Expect.equals("x", C.staticGetter2);
  Expect.equals("x", C().instanceGetter1);
  Expect.equals("x", C().instanceGetter2);
  Expect.equals("x", M.staticGetter1);
  Expect.equals("x", M.staticGetter2);
  Expect.equals("x", MA().instanceGetter1);
  Expect.equals("x", MA().instanceGetter2);
  Expect.equals("x", E.staticGetter1);
  Expect.equals("x", E.staticGetter2);
  Expect.equals("x", E.e0.instanceGetter1);
  Expect.equals("x", E.e0.instanceGetter2);
  Expect.equals("x", Ext.staticGetter1);
  Expect.equals("x", Ext.staticGetter2);
  Expect.equals("x", A().instanceGetter1);
  Expect.equals("x", A().instanceGetter2);
  Expect.equals("x", ET.staticGetter1);
  Expect.equals("x", ET.staticGetter2);
  Expect.equals("x", ET(0).instanceGetter1);
  Expect.equals("x", ET(0).instanceGetter2);
}
