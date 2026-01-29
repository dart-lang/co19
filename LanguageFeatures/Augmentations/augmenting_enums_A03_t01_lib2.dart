// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation of an enum type can add new members to the enum,
/// including new enum values. Enum values are appended in augmentation
/// application order.
///
/// @description Checks that new enum values defined by augmentation are
/// appended to the current values of the declaration in the augmentation
/// application order.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'augmenting_enums_A03_t01.dart';

augment enum E {
  e3;
}
