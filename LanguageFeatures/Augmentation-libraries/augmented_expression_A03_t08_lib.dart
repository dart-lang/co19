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
/// @description Checks that it is a compile-time error if an `augmented` is
/// used in an augmenting field's initializer and the member being augmented is
/// a nullable field with no initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t08.dart';

augment Function? topLevelVariable = () {
  return "Augment: $augmented";
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
};

augment class C {
  augment static Function? staticVariable = () {
    return "Augment: $augmented";
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment Function? instanceVariable = () {
    return "Augment: $augmented";
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

augment mixin M {
  augment static Function? staticVariable = () {
    return "Augment: $augmented";
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment Function? instanceVariable = () {
    return "Augment: $augmented";
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

augment enum E {
  augment e1;
  augment static Function? staticVariable = () {
    return "Augment: $augmented";
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

augment extension Ext {
  augment static Function? staticVariable = () {
    return "Augment: $augmented";
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
