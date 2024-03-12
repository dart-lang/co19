// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The merge order is defined as a depth-first pre-order traversal
/// of the import augment directives starting at the main library.
///
/// @description Checks the merge order of augment libraries
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
import augment 'merge_order_A01_t01_lib1.dart';
import augment 'merge_order_A01_t01_lib3.dart';

class A {}

main() {
  Expect.equals("Augmented A", A().foo());
  Expect.equals("Augmented B", B().foo());
  Expect.equals("Augmented C", C().foo());
  Expect.equals("Augmented D", D().foo());
}
