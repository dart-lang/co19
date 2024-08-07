// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Enum values can only be augmented by enum values, and the
/// implicit getter introduced by them is not augmentable.
///
/// @description Checks that it is a compile-time error to augment an enum value
/// by the constructor invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_enum_values_A02_t01.dart';

augment enum E {
  augment e0(1);
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  augment e0.foo();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}
