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
/// the augmented function. Test different parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A04_t27_lib.dart';

String augmented() => "Global augmented() function, shouldn't be invoked";

String topLevelFunction1(String value) => value;
String topLevelFunction2([String value = "default"]) => value;
String topLevelFunction3({String value = "default"}) => value;
String topLevelFunction4({required String value}) => value;

class C {
  String log = "";

  C(this.log);
  factory C.f1(String value) => C(value);
  factory C.f2([String value = "default"]) => C(value);
  factory C.f3({String value = "default"}) => C(value);
  factory C.f4({required String value}) => C(value);
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

mixin M {
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

enum E {
  e1;

  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

class A {}

extension Ext on A {
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

extension type ET(String v) {
  factory ET.f1(String value) => ET(value);
  factory ET.f2([String value = "default"]) => ET(value);
  factory ET.f3({String value = "default"}) => ET(value);
  factory ET.f4({required String value}) => ET(value);
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

class MA = Object with M;

main() {
  Expect.equals("A", topLevelFunction1("a"));
  Expect.equals("B", topLevelFunction2("b"));
  Expect.equals("C", topLevelFunction3(value:"c"));
  Expect.equals("D", topLevelFunction4(value: "d"));
  Expect.equals("A", C.f1("a").log);
  Expect.equals("B", C.f2("b").log);
  Expect.equals("C", C.f3(value: "c").log);
  Expect.equals("D", C.f4(value: "d").log);
  Expect.equals("A", C.staticMethod1("a"));
  Expect.equals("B", C.staticMethod2("b"));
  Expect.equals("C", C.staticMethod3(value: "c"));
  Expect.equals("D", C.staticMethod4(value: "d"));
  Expect.equals("A", C("x").instanceMethod1("a"));
  Expect.equals("B", C("x").instanceMethod2("b"));
  Expect.equals("C", C("x").instanceMethod3(value: "c"));
  Expect.equals("D", C("x").instanceMethod4(value: "d"));
  Expect.equals("A", M.staticMethod1("a"));
  Expect.equals("B", M.staticMethod2("b"));
  Expect.equals("C", M.staticMethod3(value: "c"));
  Expect.equals("D", M.staticMethod4(value: "d"));
  Expect.equals("A", MA().instanceMethod1("a"));
  Expect.equals("B", MA().instanceMethod2("b"));
  Expect.equals("C", MA().instanceMethod3(value: "c"));
  Expect.equals("D", MA().instanceMethod4(value: "d"));
  Expect.equals("A", E.staticMethod1("a"));
  Expect.equals("B", E.staticMethod2("b"));
  Expect.equals("C", E.staticMethod3(value: "c"));
  Expect.equals("D", E.staticMethod4(value: "d"));
  Expect.equals("A", E.e1.instanceMethod1("a"));
  Expect.equals("B", E.e1.instanceMethod2("b"));
  Expect.equals("C", E.e1.instanceMethod3(value: "c"));
  Expect.equals("D", E.e1.instanceMethod4(value: "d"));
  Expect.equals("A", Ext.staticMethod1("a"));
  Expect.equals("B", Ext.staticMethod2("b"));
  Expect.equals("C", Ext.staticMethod3(value: "c"));
  Expect.equals("D", Ext.staticMethod4(value: "d"));
  Expect.equals("A", A().instanceMethod1("a"));
  Expect.equals("B", A().instanceMethod2("b"));
  Expect.equals("C", A().instanceMethod3(value: "c"));
  Expect.equals("D", A().instanceMethod4(value: "d"));
  Expect.equals("A", ET.f1("a").v);
  Expect.equals("B", ET.f2("b").v);
  Expect.equals("C", ET.f3(value: "c").v);
  Expect.equals("D", ET.f4(value: "d").v);
  Expect.equals("A", ET.staticMethod1("a"));
  Expect.equals("B", ET.staticMethod2("b"));
  Expect.equals("C", ET.staticMethod3(value: "c"));
  Expect.equals("D", ET.staticMethod4(value: "d"));
  Expect.equals("A", ET("x").instanceMethod1("a"));
  Expect.equals("B", ET("x").instanceMethod2("b"));
  Expect.equals("C", ET("x").instanceMethod3(value: "c"));
  Expect.equals("D", ET("x").instanceMethod4(value: "d"));
}
