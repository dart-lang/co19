// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, augmented refers to the
///   augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that it is a compile-time error to call an `augmented`
/// inside an augmenting operator followed by another operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A05_t11.dart';

augment class C {
  augment String operator +(num other) {
    return augmented - other;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  augment String operator +(num other) {
    return augmented - other;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e1;
  augment String operator +(num other) {
    return augmented - other;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  augment String operator +(num other) {
    return augmented - other;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
