// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Common library for augmentation tests.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

library augmentation_libraries_lib;

class AL {
  const AL();
}

final class FinalClass {}

base class BaseClass {}

sealed class SealedClass {}

class SealedClassImpl implements SealedClass {}
