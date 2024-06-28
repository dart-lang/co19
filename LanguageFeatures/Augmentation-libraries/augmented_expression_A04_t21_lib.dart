// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, `augmented` refers to
///   the augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that it is a compile-time error to use a type whose name
/// is `augmented` in an augmenting function return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A04_t21.dart';

augment augmented topLevelFunction() {}
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static augmented staticMethod() {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented instanceMethod() {}
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static augmented staticMethod() {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented instanceMethod() {}
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  augment static augmented staticMethod() {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented instanceMethod() {}
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static augmented staticMethod() {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented instanceMethod() {}
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
