// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that augmenting constructor may add initializer list and
/// the body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  String x = "Original", y;
  C();
}

augment class C {
  augment C(): y = "Augmented" {
    Expect.equals("Original", x);
    Expect.equals("Augmented", y);
    x = "x";
    y = "y";
  }
}

enum E {
  e0;
  final String x = "Original", y;
  const E();
}

augment enum E {
  augment const E(): y = "Augmented";
}

bool executed = false;

extension type ET(int v) {
  ET.foo();
}

augment extension type ET {
  augment ET.foo() : v = 0 {
    Expect.equals(0, v);
    executed = true;
  }
}

main() {
  C c = C();
  Expect.equals("x", c.x);
  Expect.equals("y", c.y);

  Expect.equals("Original", E.e0.x);
  Expect.equals("Augmented", E.e0.y);

  Expect.equals(0, ET.foo().v);
  Expect.isTrue(executed);
}
