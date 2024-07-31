// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The `late` property of a variable must always be consistent
/// between the augmented variable and its augmenting variables.
///
/// @description Checks that `late` variable can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_variables_A04_t01_lib.dart';
import '../../Utils/expect.dart';

late String topLevelVariable = "Original";
late String finalTopLevelVariable = "Original";

class C {
  static late String staticVariable = "Original";
  static late final String finalStaticVariable = "Original";
  late String instanceVariable = "Original";
  late final String finalInstanceVariable = "Original";
}

mixin M {
  static late String staticVariable = "Original";
  static late final String finalStaticVariable = "Original";
  late String instanceVariable = "Original";
  late final String finalInstanceVariable = "Original";
}

enum E {
  e0;
  static late String staticVariable = "Original";
  static late final String finalStaticVariable = "Original";
}

class A {}

extension Ext on A {
  static late String staticVariable = "Original";
  static late final String finalStaticVariable = "Original";
}

extension type ET(String _) {
  static late String staticVariable = "Original";
  static late final String finalStaticVariable = "Original";
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
  Expect.equals("Augmented", Ext.staticVariable);
  Expect.equals("Augmented", Ext.finalStaticVariable);
  Expect.equals("Augmented", ET.staticVariable);
  Expect.equals("Augmented", ET.finalStaticVariable);
}
