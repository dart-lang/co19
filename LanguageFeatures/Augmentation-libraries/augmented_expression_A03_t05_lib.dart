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

augment library 'augmented_expression_A03_t05.dart';

augment String topLevelVariable = augmented + " - augment";
augment final String finalTopLevelVariable = augmented + " - augment";

augment class C {
  augment static String staticVariable = augmented + " - augment";
  augment static final String finalStaticVariable = augmented + " - augment";
  augment String instanceVariable = augmented + " - augment";
  augment final String finalInstanceVariable = augmented + " - augment";
}

augment mixin M {
  augment static String staticVariable = augmented + " - augment";
  augment static final String finalStaticVariable = augmented + " - augment";
  augment String instanceVariable = augmented + " - augment";
  augment final String finalInstanceVariable = augmented + " - augment";
}

augment enum E {
  augment e1;

  augment static String staticVariable = augmented + " - augment";
  augment static final String finalStaticVariable = augmented + " - augment";
  augment final String finalInstanceVariable = augmented + " - augment";
}

augment extension Ext {
  augment static String staticVariable = augmented + " - augment";
  augment static final String finalStaticVariable = augmented + " - augment";
}
