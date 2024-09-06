// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An part directive has a <uri> that denotes an entity which is
///   not a library augmentation
///
/// @description Checks that it is a compile-time error if an `part`
/// directive has an <uri> that denotes an entity which is not a library
/// augmentation
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'defining_augmentation_A07_t01_lib.dart';
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
