// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if there is more than one library
/// directive in a single file
///
/// @description Check that it is a compile-time error if there is more than one
/// library directive in a single file
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'applying_augmentation_library_A03_t02_lib.dart';

main() {
}
