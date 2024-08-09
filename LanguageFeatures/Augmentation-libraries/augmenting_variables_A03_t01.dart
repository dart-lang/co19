// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If no initializer is provided then the augmented initializer is
/// not altered.
///
/// @description Checks that if no initializer is provided then the augmented
/// initializer is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_variables_A03_t01_lib.dart';
import '../../Utils/expect.dart';

String topLevelVariable = "Original";
final String finalTopLevelVariable = "Original";

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

extension type ET(String _) {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Original", topLevelVariable);
  Expect.equals("Original", finalTopLevelVariable);
  Expect.equals("Original", C.staticVariable);
  Expect.equals("Original", C.finalStaticVariable);
  Expect.equals("Original", C().instanceVariable);
  Expect.equals("Original", C().finalInstanceVariable);
  Expect.equals("Original", M.staticVariable);
  Expect.equals("Original", M.finalStaticVariable);
  Expect.equals("Original", MA().instanceVariable);
  Expect.equals("Original", MA().finalInstanceVariable);
  Expect.equals("Original", E.staticVariable);
  Expect.equals("Original", E.finalStaticVariable);
  Expect.equals("Original", E.e0.finalInstanceVariable);
  Expect.equals("Original", Ext.staticVariable);
  Expect.equals("Original", Ext.finalStaticVariable);
  Expect.equals("Original", ET.staticVariable);
  Expect.equals("Original", ET.finalStaticVariable);
}
