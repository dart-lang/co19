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
/// @description Checks that it's not an error to augment a function whose
/// default value of a formal parameter is a constant with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A04_t35_lib.dart';

const augmented = "Const augmented";

String topLevelFunction1([String v = augmented]) => v;
String topLevelFunction2({String v = augmented}) => v;

class C {
  String log;
  C(this.log);
  factory C.f1([String v = augmented]) => C(v);
  factory C.f2({String v = augmented}) => C(v);
  static String staticMethod1([String v = augmented]) => v;
  static String staticMethod2({String v = augmented}) => v;
  String instanceMethod1([String v = augmented]) => v;
  String instanceMethod2({String v = augmented}) => v;
}

mixin M {
  static String staticMethod1([String v = augmented]) => v;
  static String staticMethod2({String v = augmented}) => v;
  String instanceMethod1([String v = augmented]) => v;
  String instanceMethod2({String v = augmented}) => v;
}

enum E {
  e1;
  static String staticMethod1([String v = augmented]) => v;
  static String staticMethod2({String v = augmented}) => v;
  String instanceMethod1([String v = augmented]) => v;
  String instanceMethod2({String v = augmented}) => v;
}

class A {}

extension Ext on A {
  static String staticMethod1([String v = augmented]) => v;
  static String staticMethod2({String v = augmented}) => v;
  String instanceMethod1([String v = augmented]) => v;
  String instanceMethod2({String v = augmented}) => v;
}

extension type ET(String v) {
  factory ET.f1([String v = augmented]) => ET(v);
  factory ET.f2({String v = augmented}) => ET(v);
  static String staticMethod1([String v = augmented]) => v;
  static String staticMethod2({String v = augmented}) => v;
  String instanceMethod1([String v = augmented]) => v;
  String instanceMethod2({String v = augmented}) => v;
}

class MA = Object with M;

main() {
  Expect.equals("Augmented: Const augmented", topLevelFunction1());
  Expect.equals("Augmented: Const augmented", topLevelFunction2());
  Expect.equals("Augmented: Const augmented", C.f1().log);
  Expect.equals("Augmented: Const augmented", C.f2().log);
  Expect.equals("Augmented: Const augmented", C.staticMethod1());
  Expect.equals("Augmented: Const augmented", C.staticMethod2());
  Expect.equals("Augmented: Const augmented", C("x").instanceMethod1());
  Expect.equals("Augmented: Const augmented", C("x").instanceMethod2());
  Expect.equals("Augmented: Const augmented", M.staticMethod1());
  Expect.equals("Augmented: Const augmented", M.staticMethod2());
  Expect.equals("Augmented: Const augmented", MA().instanceMethod1());
  Expect.equals("Augmented: Const augmented", MA().instanceMethod2());
  Expect.equals("Augmented: Const augmented", E.staticMethod1());
  Expect.equals("Augmented: Const augmented", E.staticMethod2());
  Expect.equals("Augmented: Const augmented", E.e1.instanceMethod1());
  Expect.equals("Augmented: Const augmented", E.e1.instanceMethod2());
  Expect.equals("Augmented: Const augmented", Ext.staticMethod1());
  Expect.equals("Augmented: Const augmented", Ext.staticMethod2());
  Expect.equals("Augmented: Const augmented", A().instanceMethod1());
  Expect.equals("Augmented: Const augmented", A().instanceMethod2());
  Expect.equals("Augmented: Const augmented", ET.f1().v);
  Expect.equals("Augmented: Const augmented", ET.f2().v);
  Expect.equals("Augmented: Const augmented", ET.staticMethod1());
  Expect.equals("Augmented: Const augmented", ET.staticMethod2());
  Expect.equals("Augmented: Const augmented", ET("x").instanceMethod1());
  Expect.equals("Augmented: Const augmented", ET("x").instanceMethod2());
}
