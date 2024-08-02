// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting initializer expressions replace the augmented
/// initializer (or provide one where none existed previously).
///
/// @description Checks that augmenting initializer expressions may provide the
/// initializer if it was not existed.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_variables_A02_t02_lib.dart';
import '../../Utils/expect.dart';

String topLevelVariable;
String finalTopLevelVariable;

class C {
  static String staticVariable;
  static final String finalStaticVariable;
  String instanceVariable;
  final String finalInstanceVariable;
}

mixin M {
  static String staticVariable;
  static final String finalStaticVariable;
  String instanceVariable;
  final String finalInstanceVariable;
}

enum E {
  e0;
  static String staticVariable;
  static final String finalStaticVariable;
}

class A {}

extension Ext on A {
  static String staticVariable;
  static final String finalStaticVariable;
}

extension type ET(String _) {
  static String staticVariable;
  static final String finalStaticVariable;
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
