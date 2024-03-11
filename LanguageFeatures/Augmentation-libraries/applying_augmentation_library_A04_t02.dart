// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The main library and its augmentations do not all have the same language
///   version. There is only one user-visible library at the end, and it should
///   have a consistent version across its entire surface area.
///
/// @description Check that it is a compile-time error if a main library has
/// version lower than augmentation.
/// @author sgrekhov22@gmail.com

// @dart=3.3

// SharedOptions=--enable-experiment=macros

import augment 'applying_augmentation_library_A04_t02_lib.dart';
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
