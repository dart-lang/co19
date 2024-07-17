// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a variable type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'type_inheritance_A01_t02_lib.dart';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

String topLevelVariable = "Top-level variable";
final String finalTopLevelVariable = "Final top-level variable";

class C {
  static String staticVariable = "Static variable";
  static final String finalStaticVariable = "Final static variable";
  String instanceVariable = "Instance variable";
  final String finalInstanceVariable = "Final instance variable";
}

mixin M {
  static String staticVariable = "Static variable";
  static final String finalStaticVariable = "Final static variable";
  String instanceVariable = "Instance variable";
  final String finalInstanceVariable = "Final instance variable";
}

enum E {
  e0;
  static String staticVariable = "Static variable";
  static final String finalStaticVariable = "Final static variable";
  final String finalInstanceVariable = "Final instance variable";
}

class A {}

extension Ext on A {
  static String staticVariable = "Static variable";
  static final String finalStaticVariable = "Final static variable";
}

extension type ET(int id) {
  static String staticVariable = "Static variable";
  static final String finalStaticVariable = "Final static variable";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented top-level variable",
      topLevelVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented top-level variable",
      finalTopLevelVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      C.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      C.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance variable",
      C().instanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance getter",
      C().finalInstanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      M.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      M.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance variable",
      MA().instanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance getter",
      MA().finalInstanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      E.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      E.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance getter",
      E.e0.finalInstanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      Ext.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      Ext.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      ET.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      ET.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals(42, ET(0).id.expectStaticType<Exactly<int>>());
}
