// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   getter and evaluates to the return value. If augmenting a field with a
///   getter, this will invoke the implicit getter from the augmented field.
///
/// @description Checks that it is a compile-time error to augment a getter
/// whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A01_t20.dart';

augment String get augmented => "Augmented";
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C1 {
  augment static String get augmented => "Augmented";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  augment String get augmented => "Augmented";
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M1 {
  augment static String get augmented => "Augmented";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M2 {
  augment String get augmented => "Augmented";
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E1 {
  e1;

  augment static String get augmented => "Augmented";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  e1;

  augment String get augmented => "Augmented";
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext1 on A {
  augment static String get augmented => "Augmented";
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext2 on A {
  augment String get augmented => "Augmented";
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
