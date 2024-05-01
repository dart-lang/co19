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
/// @description Checks that it is a compile-time error to declare a local
/// variable named `augmented` in an augmenting field initializer
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t13.dart';

augment Function? topLevelVariable = () {
  var augmented = 42;
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  return "Augmented";
};

augment class C {
  augment static Function? staticVariable = () {
    var augmented = 42;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  };
  augment Function? instanceVariable = () {
    var augmented = 42;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  };
}

augment mixin M {
  augment static Function? staticVariable = () {
    var augmented = 42;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  };
  augment Function? instanceVariable = () {
    var augmented = 42;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  };
}

augment enum E {
  augment e1;
  augment static Function? staticVariable = () {
    var augmented = 42;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  };
}

augment extension Ext {
  augment static Function? staticVariable = () {
    var augmented = 42;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  };
}
