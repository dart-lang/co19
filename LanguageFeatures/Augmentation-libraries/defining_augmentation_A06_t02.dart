// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A library augmentation contains a normal library directive. They are not
///   self-contained libraries, only pieces of the augmented library.
///
/// @description Checks that it is a compile-time error if a library
/// augmentation contains a normal library directive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

library defining_augmentation_A06_t02;
import augment 'defining_augmentation_A06_t02_lib.dart';

main() {
}
