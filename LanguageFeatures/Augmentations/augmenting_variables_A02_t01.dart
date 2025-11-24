// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting initializer expressions replace the augmented
/// initializer (or provide one where none existed previously).
///
/// @description Checks that augmenting initializer expressions replaces the
/// augmented initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_variables_A02_t01_lib.dart';

String originalInitializer() {
  Expect.fail("This initializer should be replaced");
  return "Original";
}

String augmentingInitializer() => "Augmented";

String topLevelVariable = originalInitializer();
String finalTopLevelVariable = originalInitializer();

class C {
  static String staticVariable = originalInitializer();
  static final String finalStaticVariable = originalInitializer();
  String instanceVariable = originalInitializer();
  final String finalInstanceVariable = originalInitializer();
}

mixin M {
  static String staticVariable = originalInitializer();
  static final String finalStaticVariable = originalInitializer();
  String instanceVariable = originalInitializer();
  final String finalInstanceVariable = originalInitializer();
}

enum E {
  e0;
  static String staticVariable = originalInitializer();
  static final String finalStaticVariable = originalInitializer();
}

class A {}

extension Ext on A {
  static String staticVariable = originalInitializer();
  static final String finalStaticVariable = originalInitializer();
}

extension type ET(String _) {
  static String staticVariable = originalInitializer();
  static final String finalStaticVariable = originalInitializer();
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
