// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a variable with a setter, this will invoke the implicitly
///   induced setter from the augmented variable declaration.
///
/// @description Checks that it is a compile-time error to augment a setter
/// whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A02_t19.dart';

augment void set augmented(String value) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C1 {
  augment static void set augmented(String value) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  augment void set augmented(String value) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M1 {
  augment static void set augmented(String value) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M2 {
  augment void set augmented(String value) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E1 {
  augment e1;
  augment static void set augmented(String value) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  augment e1;
  augment void set augmented(String value) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext1 {
  augment static void set augmented(String value) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext2 {
  augment void set augmented(String value) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET1 {
  augment static void set augmented(String value) {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET2 {
  augment void set augmented(String value) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
