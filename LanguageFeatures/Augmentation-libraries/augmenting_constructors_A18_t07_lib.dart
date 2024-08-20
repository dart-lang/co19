// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has any initializers or a body.
///
/// @description Checks that it is a compile-time error if a merged constructor
/// is cyclic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A18_t07.dart';

augment class C {
  augment C(): this.foo();
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(): this.bar();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar(): this();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
