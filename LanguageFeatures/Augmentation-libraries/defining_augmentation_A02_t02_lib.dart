// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations do not share an import scope with the main library
/// or each other. The libraries one augmentation imports are visible only to
/// that file.
///
/// @description Checks that imports in an augmentation library are not visible
/// in a main library even if an augmentation library exports it
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'defining_augmentation_A02_t02.dart';

import 'augmentation_libraries_lib.dart';
export 'augmentation_libraries_lib.dart';
