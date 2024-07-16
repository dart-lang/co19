// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'type_inheritance_A01_t01_lib.dart';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

String get topLevelGetter => "Top-level getter";
String topLevelFunction() => "Top-level function";

class C {
  static String get staticGetter => "Static getter";
  static String staticMethod() => "Static method";
  String get instanceGetter => "Instance getter";
  String instanceMethod() => "Instance method";
}

mixin M {
  static String get staticGetter => "Static getter";
  static String staticMethod() => "Static method";
  String get instanceGetter => "Instance getter";
  String instanceMethod() => "Instance method";
}

enum E {
  e0;
  static String get staticGetter => "Static getter";
  static String staticMethod() => "Static method";
  String get instanceGetter => "Instance getter";
  String instanceMethod() => "Instance method";
}

class A {}

extension Ext on A {
  static String get staticGetter => "Static getter";
  static String staticMethod() => "Static method";
  String get instanceGetter => "Instance getter";
  String instanceMethod() => "Instance method";
}

extension type ET(int id) {
  static String get staticGetter => "Static getter";
  static String staticMethod() => "Static method";
  String get instanceGetter => "Instance getter";
  String instanceMethod() => "Instance method";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented top-level getter",
      topLevelGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented top-level function",
      topLevelFunction().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static getter",
      C.staticGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static method",
      C.staticMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance getter",
      C().instanceGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance method",
      C().instanceMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static getter",
      M.staticGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static method",
      M.staticMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance getter",
      MA().instanceGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance method",
      MA().instanceMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static getter",
      E.staticGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static method",
      E.staticMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance getter",
      E.e0.instanceGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance method",
      E.e0.instanceMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static getter",
      Ext.staticGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static method",
      Ext.staticMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance method",
      A().instanceMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static getter",
      ET.staticGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented static method",
      ET.staticMethod().expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance getter",
      ET(0).instanceGetter.expectStaticType<Exactly<String>>());
  Expect.equals("Augmented instance method",
      ET(0).instanceMethod().expectStaticType<Exactly<String>>());
}
