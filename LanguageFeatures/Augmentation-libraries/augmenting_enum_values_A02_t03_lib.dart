// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an enum value, no constructor invocation should
/// be provided. The original value is always used, and the explicit constructor
/// invocation (if present) should not be copied.
///
/// @description Checks that when an augmentation of an enum value omits the
/// constructor invocation then the original value is used.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_enum_values_A02_t03.dart';

augment enum E {
  augment e0,
  augment e1,
  augment e2;
}
