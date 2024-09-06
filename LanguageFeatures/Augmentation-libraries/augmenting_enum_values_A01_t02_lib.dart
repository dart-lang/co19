// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Enum values can only be augmented by enum values, and the
/// implicit getter introduced by them is not augmentable.
///
/// @description Checks that it is a compile-time error to augment enum's
/// `values` getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_enum_values_A01_t02.dart';

augment enum E1 {
  augment e0;
  augment static List<E1> get values;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  augment e0;
  augment static List<E2> get values => [e0];
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E3 {
  augment e0;
  augment static List<E3> get values => augmented;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
