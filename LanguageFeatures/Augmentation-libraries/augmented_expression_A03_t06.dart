// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting variable declaration, `augmented`
///   can only be used in an initializer expression, and refers to the augmented
///   variable's initializing expression, which is immediately evaluated.
///
/// It is a compile-time error to use `augmented` in an augmenting variable's
/// initializer if the member being augmented is not a variable declaration with
/// an initializing expression.
///
/// @description Checks that within an augmenting field `augmented` invokes the
/// original field's initializer expression. Test the case when the field is
/// augmented more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t06_lib1.dart';
import augment 'augmented_expression_A03_t06_lib2.dart';
import '../../Utils/expect.dart';

const augmented = "Top-level constant, shouldn't be used";

String topLevelVariable = "Original";
final String finalTopLevelVariable = "Original";

class C {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  static final String augmented = "C.augmented, shouldn't be used";
}

mixin M {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  static final String augmented = "M.augmented, shouldn't be used";
}

enum E {
  e1;

  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  final String finalInstanceVariable = "Original";
  static final String augmented = "E.augmented, shouldn't be used";
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  static final String augmented = "Ext.augmented, shouldn't be used";
}

class MA = Object with M;

main() {
  Expect.equals("Augment2: Augment1: Original", topLevelVariable);
  Expect.equals("Augment2: Augment1: Original", finalTopLevelVariable);
  Expect.equals("Augment2: Augment1: Original", C.staticVariable);
  Expect.equals("Augment2: Augment1: Original", C.finalStaticVariable);
  Expect.equals("Augment2: Augment1: Original", C().instanceVariable);
  Expect.equals("Augment2: Augment1: Original", C().finalInstanceVariable);
  Expect.equals("Augment2: Augment1: Original", M.staticVariable);
  Expect.equals("Augment2: Augment1: Original", M.finalStaticVariable);
  Expect.equals("Augment2: Augment1: Original", MA().instanceVariable);
  Expect.equals("Augment2: Augment1: Original", MA().finalInstanceVariable);
  Expect.equals("Augment2: Augment1: Original", E.staticVariable);
  Expect.equals("Augment2: Augment1: Original", E.finalStaticVariable);
  Expect.equals("Augment2: Augment1: Original", E.e1.finalInstanceVariable);
  Expect.equals("Augment2: Augment1: Original", Ext.staticVariable);
  Expect.equals("Augment2: Augment1: Original", Ext.finalStaticVariable);
}
