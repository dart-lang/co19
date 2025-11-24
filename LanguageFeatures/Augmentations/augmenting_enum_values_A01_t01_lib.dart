// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Enum values can only be augmented by enum values, and the
/// implicit getter introduced by them is not augmentable.
///
/// @description Checks that it is a compile-time error to augment enum's
/// implicit getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_enum_values_A01_t01.dart';

augment enum E1 {
  e1;
  augment static E1 get e0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  e1;
  augment static E2 get e0 => e0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E3 {
  e1;
  augment static E3 get e0 => augmented;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
