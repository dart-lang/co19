// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if a constructor augmentation
/// reorders named parameters of the original constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x, y;
  C({this.x = 0, this.y = 0});
}

augment class C {
  augment C({int y, int x});
}

enum E {
  e0(x: 1, y: 2);
  final int x, y;
  const E({this.x = 0, this.y = 0});
}

augment enum E {
  augment const E({int y, int x});
}

extension type ET(int x) {
  ET.foo({this.x = 0, int y = 0});
}

augment extension type ET {
  augment ET.foo({int y, int x});
}

main() {
  Expect.equals(1, C(x: 1, y: 2).x);
  Expect.equals(2, C(y: 2).y);
  Expect.equals(1, E.e0.x);
  Expect.equals(2, E.e0.y);
  Expect.equals(1, ET.foo(x: 1));
}
