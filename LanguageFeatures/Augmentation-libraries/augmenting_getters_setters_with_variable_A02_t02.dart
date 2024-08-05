// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a non-abstract, non-external variable is augmented by an
/// augmenting getter or setter, you can still augment the variable, as you are
/// only augmenting the initializer, metadata, or doc comments of the augmented
/// variable. This is not considered to be augmenting the augmenting getter or
/// setter, since those are not actually altered.
///
/// @description Checks that it is not an error to augment a variable by a
/// setter and than by a variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_getters_setters_with_variable_A02_t02_lib1.dart';
import augment 'augmenting_getters_setters_with_variable_A02_t02_lib2.dart';
import '../../Utils/expect.dart';

String topLevelVariable = "Original";

class C {
  static String staticVariable = "Original";
  String instanceVariable = "Original";
}

mixin M {
  static String staticVariable = "Original";
  String instanceVariable = "Original";
}

enum E {
  e0;
  static String staticVariable = "Original";
  final String instanceVariable = "Original";
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
}

extension type ET(int _) {
  static String staticVariable = "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augment2: Original", topLevelVariable);
  Expect.equals("Augment2: Original", C.staticVariable);
  Expect.equals("Augment2: Original", C().instanceVariable);
  Expect.equals("Augment2: Original", M.staticVariable);
  Expect.equals("Augment2: Original", MA().instanceVariable);
  Expect.equals("Augment2: Original", E.staticVariable);
  Expect.equals("Augment2: Original", Ext.staticVariable);
  Expect.equals("Augment2: Original", ET.staticVariable);
}
