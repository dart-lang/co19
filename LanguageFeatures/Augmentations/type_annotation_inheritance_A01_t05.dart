// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may omit type annotations for a return
/// type, variable type, parameter type, or type parameter bound. In the last
/// case, that includes omitting the `extends` keyword. For a variable, a `var`
/// keyword replaces the type if the variable isn't `final`.
///
/// If a type annotation or type parameter bound is omitted in the augmenting
/// declaration, it is inferred to be the same as the corresponding type
/// annotation or type parameter bound in the declaration being augmented.
///
/// @description Check that augmenting declarations may have no type annotations
/// for a variable type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

String topLevelVariable;
final String finalTopLevelVariable = "Final top-level variable";

augment var topLevelVariable = "Augmented top-level variable";
augment final finalTopLevelVariable;

class C {
  static String staticVariable;
  static final String finalStaticVariable = "Final static variable";
  String instanceVariable;
  final String finalInstanceVariable = "Final instance variable";
}

augment class C {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment var instanceVariable = "Augmented instance variable";
  augment final finalInstanceVariable;
}

mixin M {
  static String staticVariable;
  static final String finalStaticVariable = "Final static variable";
  String instanceVariable;
  final String finalInstanceVariable = "Final instance variable";
}

augment mixin M {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment var instanceVariable = "Augmented instance variable";
  augment final finalInstanceVariable;
}

enum E {
  e0;
  static String staticVariable;
  static final String finalStaticVariable = "Final static variable";
  final String finalInstanceVariable = "Final instance variable";
}

augment enum E {
  ;
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment final finalInstanceVariable;
}

class A {}

extension Ext on A {
  static String staticVariable;
  static final String finalStaticVariable = "Final static variable";
}

augment extension Ext {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
}

extension type ET(int id) {
  static String staticVariable;
  static final String finalStaticVariable = "Final static variable";
}

augment extension type ET {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment final id;
}

class MA = Object with M;

main() {
  Expect.equals("Augmented top-level variable",
      topLevelVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final top-level variable",
      finalTopLevelVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      C.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final static variable",
      C.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance variable",
      C().instanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final instance variable",
      C().finalInstanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      M.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final static variable",
      M.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance variable",
      MA().instanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final instance variable",
      MA().finalInstanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      E.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final static variable",
      E.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final instance variable",
      E.e0.finalInstanceVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      Ext.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final static variable",
      Ext.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static variable",
      ET.staticVariable.expectStaticType<Exactly<String>>());
  Expect.equals("Final static variable",
      ET.finalStaticVariable.expectStaticType<Exactly<String>>());
  Expect.equals(0, ET(0).id.expectStaticType<Exactly<int>>());
}
