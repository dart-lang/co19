// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The merge order is defined as a depth-first pre-order traversal
/// of the import augment directives starting at the main library.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration appears in a library before the library where the original
/// declaration occurs, according to merge order
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'merge_order_A01_t02_lib1.dart';

class B {}

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
