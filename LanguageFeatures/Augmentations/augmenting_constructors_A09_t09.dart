// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that an augmentation of an incomplete primary
/// constructor of a class may add a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C1() {}

augment class C1 {
  augment C1() {}
}

class C2.foo(int v);

augment class C2 {
  int? _v;
  augment C2.foo(int v) {
    _v = v;
  }
}

main() {
  C1();
  Expect.equals(2, C2.foo(2)._v);
}
