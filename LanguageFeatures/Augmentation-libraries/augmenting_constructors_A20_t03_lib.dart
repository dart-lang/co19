// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting factory constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has a body.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor indirectly references itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A20_t03.dart';

augment class C {
  augment factory C() = C.bar;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.foo() = C;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.bar() = C.foo;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}
