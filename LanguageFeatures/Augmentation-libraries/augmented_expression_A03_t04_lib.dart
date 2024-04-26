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
/// @description Checks that it is a compile-time error to use `augmented=`
/// setter within an augmenting field
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t04.dart';

augment String topLevelVariable = "Augment: ${augmented = 'a'}";
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment final String finalTopLevelVariable = "Augment: ${augmented = 'b'}";
//                                                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static String staticVariable = "Augment: ${augmented = 'c'}";
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final String finalStaticVariable =
      "Augment: ${augmented = 'd'}";
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "Augment: ${augmented = 'e'}";
//                                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final String finalInstanceVariable = "Augment: ${augmented = 'f'}";
//                                                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static String staticVariable = "Augment: ${augmented = 'g'}";
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final String finalStaticVariable =
      "Augment: ${augmented = 'h'}";
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "Augment: ${augmented = 'i'}";
//                                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final String finalInstanceVariable = "Augment: ${augmented = 'j'}";
//                                                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  augment static String staticVariable = "Augment: ${augmented = 'k'}";
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final String finalStaticVariable =
      "Augment: ${augmented = 'l'}";
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final String finalInstanceVariable = "Augment: ${augmented = 'm'}";
//                                                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static String staticVariable = "Augment: ${augmented = 'n'}";
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final String finalStaticVariable =
      "Augment: ${augmented = 'o'}";
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
