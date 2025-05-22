// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations are applied in least to greatest order using the
/// after relation.
///
/// @description Checks that augmentation declaration is applied after any
/// augmentation declarations that are before it, and before augmentation
/// declarations that it is before.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'application_order_A01_t02.dart';
part 'application_order_A01_t02_lib2.dart';

augment enum E {
  e3;
}
