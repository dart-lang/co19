// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations aren't allowed to replace code, so they mostly add
/// entirely new declarations to the surrounding type. However, function and
/// constructor augmentations can fill in a body for an augmented declaration
/// that is lacks one.
///
/// @description Checks that it is still a compile-time error if a body of an
/// abstract member of a non-abstract class is not provided by an augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of  'augmenting_declarations_A05_t03.dart';

augment class C {}

augment enum E {
  augment e0;
}

augment extension Ext {}

augment extension type ET {}
