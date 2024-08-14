// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
/// ...
///   - In the augmenting constructor's body, an `augmented()` call executes the
///     augmented constructor's body in the same parameter scope that the
///     augmenting body is executing in. The expression has type `void` and
///     evaluates to `null`.
///
/// @description Checks that it is a compile-time error to use `augmented()` in
/// an initializer list of an augmenting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A10_t07.dart';

augment class C {
  augment C(): augmented() {
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e0;
  augment const E(): augmented();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo(this.id): augmented() {
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
