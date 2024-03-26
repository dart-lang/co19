// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The same augmentation library is applied more than once.
///
/// @description Check that it is a compile-time error if the same augmentation
/// library is applied more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'applying_augmentation_library_A03_t01.dart';
