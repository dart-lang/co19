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
/// the augmented function with appropriate default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A04_t26_lib.dart';

String augmented() => "Global augmented() function, shouldn't be invoked";

String topLevelFunction1([String value = "default"]) => value;
String topLevelFunction2({String value = "default"}) => value;

class C {
  String log = "";

  C(this.log);
  factory C.f1([String value = "default"]) {
    return C(value);
  }
  factory C.f2({String value = "default"}) {
    return C(value);
  }
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
  factory ET.f1([String value = "default"]) {
    return ET(value);
  }
  factory ET.f2({String value = "default"}) {
    return ET(value);
  }
  static String staticMethod1([String value = "default"]) => value;
  static String staticMethod2({String value = "default"}) => value;
  String instanceMethod1([String value = "default"]) => value;
  String instanceMethod2({String value = "default"}) => value;
}

class MA = Object with M;

main() {
  Expect.equals("default", topLevelFunction1());
  Expect.equals("default", topLevelFunction2());
  Expect.equals("default", C.f1().log);
  Expect.equals("default", C.f2().log);
  Expect.equals("default", C.staticMethod1());
  Expect.equals("default", C.staticMethod2());
  Expect.equals("default", C("x").instanceMethod1());
  Expect.equals("default", C("x").instanceMethod2());
  Expect.equals("default", M.staticMethod1());
  Expect.equals("default", M.staticMethod2());
  Expect.equals("default", MA().instanceMethod1());
  Expect.equals("default", MA().instanceMethod2());
  Expect.equals("default", E.staticMethod1());
  Expect.equals("default", E.staticMethod2());
  Expect.equals("default", E.e1.instanceMethod1());
  Expect.equals("default", E.e1.instanceMethod2());
  Expect.equals("default", Ext.staticMethod1());
  Expect.equals("default", Ext.staticMethod2());
  Expect.equals("default", A().instanceMethod1());
  Expect.equals("default", A().instanceMethod2());
  Expect.equals("default", ET.staticMethod1());
  Expect.equals("default", ET.staticMethod2());
  Expect.equals("default", ET.f1().v);
  Expect.equals("default", ET.f2().v);
  Expect.equals("default", ET("x").instanceMethod1());
  Expect.equals("default", ET("x").instanceMethod2());
}
