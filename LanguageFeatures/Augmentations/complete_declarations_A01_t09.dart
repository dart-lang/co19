// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is not an error if an augmenting constructor has
/// no body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int v;
  C() : v = 0;
  C.id(this.v) {
    v++;
  }
}

augment class C {
  augment C();
  augment C.id(this.v);
}

enum E {
  e0, e1.id();
  const E();
  const E.id();
}

augment enum E {
  e2;
  augment const E();
  augment const E.id();
}

extension type ET(int v) {
  ET.foo(this.v) {
    assert(v > 0);
  }
}

augment extension type ET {
  augment ET(int v);
  augment ET.foo(this.v);
}

main() {
  Expect.equals(0, C().v);
  Expect.equals(2, C.id(1).v);
  Expect.equals(1, ET(1).v);
  Expect.equals(2, ET.foo(2).v);
  if (assertStatementsEnabled) {
    Expect.throws(() {
      ET.foo(0);
    });
  }
}
