// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` must be
///   followed by the operator. For example when augmenting `+` you must do
///   `augmented + 1`, and when augmenting `[]` you must do `augmented[<arg>]`.
///   These constructs invoke the augmented operator, and are the only valid
///   uses of `augmented` in these contexts.
///
/// @description Checks that it is a compile-time error if an augmenting
/// operator has a parameter with a type whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A05_t16.dart';

augment class C {
  augment String operator +(augmented other) => "C +";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String operator [](augmented index) => "C[]";
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void operator []=(augmented index, String value) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment String operator +(augmented other) => "M +";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String operator [](augmented index) => "M[]";
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void operator []=(int index, augmented value) {}
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  augment String operator +(augmented other) => "E +";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String operator [](augmented index) => "E[]";
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void operator []=(augmented index, String value) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext on A {
  augment String operator +(augmented other) => "Ext +";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String operator [](augmented index) => "Ext[]";
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void operator []=(int index, augmented value) {}
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
