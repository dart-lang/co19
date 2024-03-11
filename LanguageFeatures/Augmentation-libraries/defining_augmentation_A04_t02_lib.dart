// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmentation library contains any part directives.
///
/// @description Checks that it is no error if a library that has an
/// augmentation contains a part directive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

library augment 'defining_augmentation_A04_t02.dart';
