// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion New enum values may be defined in an augmenting enum, and they
/// will be appended to the current values of the declaration in augmentation
/// application order.
///
/// @description Checks that new enum values defined by augmentation are
/// appended to the current values of the declaration in the augmentation
/// application order.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_enum_values_A03_t01.dart';

augment enum E {
  e3;
}
