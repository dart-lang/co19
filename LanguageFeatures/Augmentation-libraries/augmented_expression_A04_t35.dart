// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, `augmented` refers to
///   the augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that it's not an error to augment function whose default
/// value of a formal parameters is a constant with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A04_t35_lib.dart';
import '../../Utils/expect.dart';

const augmented = "Const augmented";

String topLevelFunction1([String v = augmented]) => v;
String topLevelFunction2({String v = augmented}) => v;

class C {
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

class MA = Object with M;

main() {
  Expect.equals("Augmented: Const augmented", topLevelFunction1());
  Expect.equals("Augmented: Const augmented", topLevelFunction2());
  Expect.equals("Augmented: Const augmented", C.staticMethod1());
  Expect.equals("Augmented: Const augmented", C.staticMethod2());
  Expect.equals("Augmented: Const augmented", C().instanceMethod1());
  Expect.equals("Augmented: Const augmented", C().instanceMethod2());
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
}
