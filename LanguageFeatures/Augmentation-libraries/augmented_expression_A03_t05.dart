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
/// @description Checks that it is not an error to use `augmented +` within an
/// augmenting field if the field has a type which has an operator `+` and an
/// actual argument with a valid type is given
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t05_lib.dart';
import '../../Utils/expect.dart';

const augmented = false;

String topLevelVariable = "Original";
final String finalTopLevelVariable = "Original";

class C {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  final bool augmented = false;
}

mixin M {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  final bool augmented = false;
}

enum E {
  e1;

  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  final String finalInstanceVariable = "Original";
  final bool augmented = false;
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  static bool augmented = false;
}

class MA = Object with M;

main() {
  Expect.equals("Original - augment", topLevelVariable);
  Expect.equals("Original - augment", finalTopLevelVariable);
  Expect.equals("Original - augment", C.staticVariable);
  Expect.equals("Original - augment", C.finalStaticVariable);
  Expect.equals("Original - augment", C().instanceVariable);
  Expect.equals("Original - augment", C().finalInstanceVariable);
  Expect.equals("Original - augment", M.staticVariable);
  Expect.equals("Original - augment", M.finalStaticVariable);
  Expect.equals("Original - augment", MA().instanceVariable);
  Expect.equals("Original - augment", MA().finalInstanceVariable);
  Expect.equals("Original - augment", E.staticVariable);
  Expect.equals("Original - augment", E.finalStaticVariable);
  Expect.equals("Original - augment", E.e1.finalInstanceVariable);
  Expect.equals("Original - augment", Ext.staticVariable);
  Expect.equals("Original - augment", Ext.finalStaticVariable);
}
