// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting a variable with a variable: Augmenting a variable with
/// a variable only alters its initializer, metadata, or doc comments. As usual,
/// external and abstract variables cannot augment their initializing
/// expression, since it does not exist.
///
/// @description Checks that augmenting a variable with a variable alters its
/// initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_variables_A01_t01_lib.dart';
import '../../Utils/expect.dart';

String topLevelVariable = "Original";
String finalTopLevelVariable = "Original";

class C {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
}

mixin M {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
}

enum E {
  e0;
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  final String finalInstanceVariable = "Original";
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
}

extension type ET(String finalInstanceVariable) {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", topLevelVariable);
  Expect.equals("Augmented", finalTopLevelVariable);
  Expect.equals("Augmented", C.staticVariable);
  Expect.equals("Augmented", C.finalStaticVariable);
  Expect.equals("Augmented", C().instanceVariable);
  Expect.equals("Augmented", C().finalInstanceVariable);
  Expect.equals("Augmented", M.staticVariable);
  Expect.equals("Augmented", M.finalStaticVariable);
  Expect.equals("Augmented", MA().instanceVariable);
  Expect.equals("Augmented", MA().finalInstanceVariable);
  Expect.equals("Augmented", E.staticVariable);
  Expect.equals("Augmented", E.finalStaticVariable);
  Expect.equals("Augmented", E.e0.finalInstanceVariable);
  Expect.equals("Augmented", Ext.staticVariable);
  Expect.equals("Augmented", Ext.finalStaticVariable);
  Expect.equals("Augmented", ET.staticVariable);
  Expect.equals("Augmented", ET.finalStaticVariable);
  Expect.equals("Augmented", ET("X").finalInstanceVariable);
}
