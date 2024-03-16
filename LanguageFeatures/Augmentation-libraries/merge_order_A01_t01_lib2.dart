// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The merge order is defined as a depth-first pre-order traversal
/// of the import augment directives starting at the main library.
///
/// @description Checks the merge order of augment libraries
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

library augment 'merge_order_A01_t01_lib1.dart';

augment class B {
  String foo() => "Augmented B";
}
class C {}
class D {}
