// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is not an error if augmenting constructor
/// specifies default values for optional parameters. Test primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C1([var int x]);

augment class C1 {
  augment C1([int x = 1]);
}

class C2({var int x});

augment class C2 {
  augment C2({int x = 1});
}

enum E1([var int x]) {
  e0;
}

augment enum E1 {
  ;
  augment const E1([int x = 1]);
}

enum E2({var int x}) {
 e0;
}

augment enum E2 {
  ;
  augment const E2({int x = 1});
}

main() {
  Expect.equals(1, C1().x);
  Expect.equals(1, C2().x);
  Expect.equals(1, E1.e0.x);
  Expect.equals(1, E2.e0.x);
}
