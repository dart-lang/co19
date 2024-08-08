// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A final variable can be augmented with a non-final augmenting
/// variable, and that will not add any setter. An augmenting variable
/// declaration only affects the initializer expression, not setters.
///
/// @description Checks that a final variable can be augmented with a non-final
/// augmenting variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A04_t01_lib.dart';
import '../../Utils/expect.dart';

final String topLevelVariable = "topLevelVariable";

class C {
  static final String staticVariable = "staticVariable";
  final String instanceVariable = "instanceVariable";
}

mixin M {
  static final String staticVariable = "staticVariable";
  final String instanceVariable = "instanceVariable";
}

enum E {
  e0;
  static final String staticVariable = "staticVariable";
  final String instanceVariable = "instanceVariable";
}

class A {}

extension Ext on A {
  static final String staticVariable = "staticVariable";
}

extension type ET(String _) {
  static final String staticVariable = "staticVariable";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", topLevelVariable);
  Expect.equals("Augmented", C.staticVariable);
  Expect.equals("Augmented", C().instanceVariable);
  Expect.equals("Augmented", M.staticVariable);
  Expect.equals("Augmented", MA().instanceVariable);
  Expect.equals("Augmented", E.staticVariable);
  Expect.equals("Augmented", E.e0.instanceVariable);
  Expect.equals("Augmented", Ext.staticVariable);
  Expect.equals("Augmented", ET.staticVariable);
}
