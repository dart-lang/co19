// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations do not share an import scope with the main library
/// or each other. The libraries one augmentation imports are visible only to
/// that file.
///
/// @description Checks that if part of does exports then augmented
/// library implicitly exports it
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import 'defining_augmentation_A02_t06_augmented_lib.dart';

main() {
  print(AL);
}
