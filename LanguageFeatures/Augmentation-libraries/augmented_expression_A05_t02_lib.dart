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
/// @description Checks that it is a compile-time error call `augmented()` as a
/// method inside of an augmenting operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A05_t02.dart';

augment class C {
  augment String operator +(Object other) {
    return augmented(other);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  augment String operator +(Object other) {
    return augmented(other);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e1;
  augment String operator +(Object other) {
    return augmented(other);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  augment String operator +(Object other) {
    return augmented(other);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
