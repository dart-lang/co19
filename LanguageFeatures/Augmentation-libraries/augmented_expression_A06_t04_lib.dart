// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting enum values: When augmenting an enum value, `augmented` has no
///   meaning and is not allowed.
///
/// @description Checks that it is a compile-time error to augment an enum value
/// with an augmenting declaration that passes `augmented` as an actual argument
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A06_t04.dart';

augment enum E1 {
  augment e1.required(augmented),
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e2.named(y: augmented),
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e3.fromE0(E0.augmented);
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
