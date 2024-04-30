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
/// If augmented refers to a variable declaration (as defined by a declaration
/// and a number of prior augmentations) with no initializer expression, and the
/// variable's type is nullable, augmented evaluates to null. If the variable's
/// type is not nullable, then it's a compile-time error.
///
/// @description Checks that if an `augmented` is used in an augmenting field's
/// initializer and the member being augmented is a nullable field with no
/// initializer then `augmented` evaluates to `null`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t07.dart';

augment String? topLevelVariable = "Augment: $augmented";

augment class C {
  augment static String? staticVariable = "Augment: $augmented";
  augment String? instanceVariable = "Augment: $augmented";
}

augment mixin M {
  augment static String? staticVariable = "Augment: $augmented";
  augment String? instanceVariable = "Augment: $augmented";
}

augment enum E {
  augment e1;

  augment static String? staticVariable = "Augment: $augmented";
}

augment extension Ext {
  augment static String? staticVariable = "Augment: $augmented";
}
