// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// ...
///   - Add initializers (and/or asserts) to the initializer list, as well as a
///     `super`  call at the end of the initializer list.
///
/// @description Checks that augmenting constructor may add initializers to the
/// initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A11_t01_lib.dart';

class C {
  String x, y;
  C(): x = "Original";
}

enum E {
  e0;
  final String x, y;
  const E(): x = "Original";
}

extension type ET(int v) {
  ET.foo() : v = 0;
}

main() {
  C c = C();
  Expect.equals("x", c.x);
  Expect.equals("y", c.y);

  Expect.equals("Original", E.e0.x);
  Expect.equals("Augmented", E.e0.y);
  if (assertStatementsEnabled) {
    Expect.throws(() {
      ET.foo();
    });
  }
}
