// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting field, augmented can only be used
///   in an initializer expression, and refers to the original field's
///   initializer expression, which is immediately evaluated.
///
/// It is a compile-time error to use augmented in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that within an augmenting field `augmented` invokes the
/// original field's initializer expression. Test a  case when `augmented` is
/// called more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t31.dart';

augment var topLevelVariable = "1: $augmented, 2: " + augmented;

augment final finalTopLevelVariable = "1: $augmented, 2: " + augmented;

augment class C {
  augment static var staticVariable = "1: $augmented, 2: " + augmented;
  augment static final finalStaticVariable = "1: $augmented, 2: " + augmented;
  augment var instanceVariable = "1: $augmented, 2: " + augmented;
  augment final finalInstanceVariable ="1: $augmented, 2: " + augmented;
}

augment mixin M {
  augment static var staticVariable = "1: $augmented, 2: " + augmented;
  augment static final finalStaticVariable = "1: $augmented, 2: " + augmented;
  augment var instanceVariable = "1: $augmented, 2: " + augmented;
  augment final finalInstanceVariable ="1: $augmented, 2: " + augmented;
}

augment enum E {
  augment e1;

  augment static var staticVariable = "1: ${augmented()}, 2: " + augmented();
  augment static final finalStaticVariable
      = "1: ${augmented()}, 2: " + augmented();
  augment final finalInstanceVariable ="1: ${augmented()}, 2: " + augmented();
}

augment extension Ext {
  augment static var staticVariable = "1: $augmented, 2: " + augmented;
  augment static final finalStaticVariable = "1: $augmented, 2: " + augmented;
}
