// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations are applied in least to greatest order using the
/// after relation.
///
/// @description Checks that it is a compile-time error if an augmentation
/// declaration is applied before the introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'application_order_A01_t03_lib1.dart';

class B {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
