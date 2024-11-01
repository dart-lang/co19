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
/// @description Checks that it is a compile-time error if an augmenting
/// field initializer contains a record with a named parameter whose name is
/// `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A03_t27.dart';

augment Record topLevelVariable = (augmented: 1);
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static Record staticVariable = (augmented: 1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Record instanceVariable = (augmented: 1);
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static Record staticVariable = (augmented: 1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Record instanceVariable = (augmented: 1);
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  e1;
  augment static Record staticVariable = (augmented: 1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final Record instanceVariable = (augmented: 1);
//                                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static Record staticVariable = (augmented: 1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static Record staticVariable = (augmented: 1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
