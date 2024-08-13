// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
///   - If the augmenting constructor has an explicit block body, then that body
///     replaces any existing constructor body.
///
/// @description Checks that it is a compile-time error to augment a default
/// unnamed constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A09_t04.dart';

augment class C1 {
  augment C1();
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  augment C2.new() {}
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E1 {
  augment e0;
  augment const E1();
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  augment e0;
  augment const E2.new();
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
