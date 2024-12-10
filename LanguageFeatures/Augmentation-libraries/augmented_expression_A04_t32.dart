// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that within an augmenting function `augmented()` invokes
/// the augmented function with appropriate default values. Test the case when a
/// function is augmented more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A04_t32_lib1.dart';
part 'augmented_expression_A04_t32_lib2.dart';

String augmented() => "Global augmented() function, shouldn't be invoked";

String topLevelFunction1([String value = "default"]) => value;
String topLevelFunction2({String value = "default"}) => value;

class C {
  String log;
  C(this.log);
  factory C.f1([String value = "default"]) => C(value);
  factory C.f2({String value = "default"}) => C(value);
  static String staticMethod1([String value = "default"]) => value;
  static String staticMethod2({String value = "default"}) => value;
  String instanceMethod1([String value = "default"]) => value;
  String instanceMethod2({String value = "default"}) => value;
}

mixin M {
  static String staticMethod1([String value = "default"]) => value;
  static String staticMethod2({String value = "default"}) => value;
  String instanceMethod1([String value = "default"]) => value;
  String instanceMethod2({String value = "default"}) => value;
}

enum E {
  e1;

  static String staticMethod1([String value = "default"]) => value;
  static String staticMethod2({String value = "default"}) => value;
  String instanceMethod1([String value = "default"]) => value;
  String instanceMethod2({String value = "default"}) => value;
}

class A {}

extension Ext on A {
  static String staticMethod1([String value = "default"]) => value;
  static String staticMethod2({String value = "default"}) => value;
  String instanceMethod1([String value = "default"]) => value;
  String instanceMethod2({String value = "default"}) => value;
}

extension type ET(String v) {
  factory ET.f1([String value = "default"]) => ET(value);
  factory ET.f2({String value = "default"}) => ET(value);
  static String staticMethod1([String value = "default"]) => value;
  static String staticMethod2({String value = "default"}) => value;
  String instanceMethod1([String value = "default"]) => value;
  String instanceMethod2({String value = "default"}) => value;
}

class MA = Object with M;

main() {
  Expect.equals("Augmented 2", topLevelFunction1());
  Expect.equals("Augmented 2", topLevelFunction2());
  Expect.equals("Augmented 2", C.f1().log);
  Expect.equals("Augmented 2", C.f2().log);
  Expect.equals("Augmented 2", C.staticMethod1());
  Expect.equals("Augmented 2", C.staticMethod2());
  Expect.equals("Augmented 2", C().instanceMethod1());
  Expect.equals("Augmented 2", C().instanceMethod2());
  Expect.equals("Augmented 2", M.staticMethod1());
  Expect.equals("Augmented 2", M.staticMethod2());
  Expect.equals("Augmented 2", MA().instanceMethod1());
  Expect.equals("Augmented 2", MA().instanceMethod2());
  Expect.equals("Augmented 2", E.staticMethod1());
  Expect.equals("Augmented 2", E.staticMethod2());
  Expect.equals("Augmented 2", E.e1.instanceMethod1());
  Expect.equals("Augmented 2", E.e1.instanceMethod2());
  Expect.equals("Augmented 2", Ext.staticMethod1());
  Expect.equals("Augmented 2", Ext.staticMethod2());
  Expect.equals("Augmented 2", A().instanceMethod1());
  Expect.equals("Augmented 2", A().instanceMethod2());
  Expect.equals("Augmented 2", ET.staticMethod1());
  Expect.equals("Augmented 2", ET.staticMethod2());
  Expect.equals("Augmented 2", ET("x").instanceMethod1());
  Expect.equals("Augmented 2", ET("x").instanceMethod2());
}
