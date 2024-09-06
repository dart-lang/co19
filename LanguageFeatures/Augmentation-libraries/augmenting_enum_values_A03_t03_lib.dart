// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion New enum values may be defined in an augmenting enum, and they
/// will be appended to the current values of the declaration in augmentation
/// application order.
///
/// @description Checks that it is a compile-time error if the same value is
/// added more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_enum_values_A03_t03.dart';

augment enum E {
  e1;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
