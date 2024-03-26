// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a library tries to augment itself
///
/// @description Checks that it is a compile-time error if a library tries to
/// augment itself
/// @author sgrekhov22@gmail.com
/// @issue 55168, 55169

// SharedOptions=--enable-experiment=macros

augment library 'defining_augmentation_A05_t01.dart';
//               ^
// [analyzer] unspecified
// [cfe] unspecified

import augment 'defining_augmentation_A05_t01.dart';
//              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
