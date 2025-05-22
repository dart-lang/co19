// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations are applied in least to greatest order using the
/// after relation.
///
/// @description Checks that augmentation declaration is applied after any
/// augmentation declarations that are before it, and before augmentation
/// declarations that it is before.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'application_order_A01_t01_lib.dart';

enum E {
  e1;
}

augment enum E {
  e2;
}

main() {
  Expect.listEquals([E.e1, E.e2, E.e3], E.values);
}
