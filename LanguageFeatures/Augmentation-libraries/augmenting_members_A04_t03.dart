// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A final variable can be augmented with a non-final augmenting
/// variable, and that will not add any setter. An augmenting variable
/// declaration only affects the initializer expression, not setters.
///
/// @description Checks that a final `late` variable can be augmented with a
/// non-final `late` augmenting variable. Test the case when augmentation has
/// no initializing value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A04_t03_lib.dart';
import '../../Utils/expect.dart';

late final String topLevelVariable;

class C {
  static late final String staticVariable;
  late final String instanceVariable;
}

mixin M {
  static late final String staticVariable;
  late final String instanceVariable;
}

enum E {
  e0;
  static late final String staticVariable;
}

class A {}

extension Ext on A {
  static late final String staticVariable;
}

extension type ET(String _) {
  static late final String staticVariable;
}

class MA = Object with M;

main() {
  topLevelVariable = "topLevelVariable";
  Expect.equals("topLevelVariable", topLevelVariable);
  C.staticVariable = "staticVariable";
  Expect.equals("staticVariable", C.staticVariable);
  C().instanceVariable = "instanceVariable";
  Expect.equals("instanceVariable", C().instanceVariable);
  M.staticVariable = "staticVariable";
  Expect.equals("staticVariable", M.staticVariable);
  MA().instanceVariable = "instanceVariable";
  Expect.equals("instanceVariable", MA().instanceVariable);
  E.staticVariable = "staticVariable";
  Expect.equals("staticVariable", E.staticVariable);
  Ext.staticVariable = "staticVariable";
  Expect.equals("staticVariable", Ext.staticVariable);
  ET.staticVariable = "staticVariable";
  Expect.equals("staticVariable", ET.staticVariable);
}
