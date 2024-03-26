// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The library referenced in a `augment library` directive does not have an
///   `import augment` directive pointing back to this augmentation.
///
/// @description Check that it is a compile-time error if a library referenced
/// in an `augment library` directive is not an does not have a `import augment`
/// directive pointing back to this augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'applying_augmentation_library_A02_t02.dart';

// Another augmentation library of 'applying_augmentation_library_A02_t02.dart'
