// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An export or import directive refers to an entity which is not a library.
///
/// @description Checks that it is a compile-time error if an `export` refers to
/// an entity which is not a library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'defining_augmentation_A08_t03_lib.dart';
export 'defining_augmentation_A08_t03_lib.dart';
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
