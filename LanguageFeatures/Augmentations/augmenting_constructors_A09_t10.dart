// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that an augmentation of an incomplete primary
/// constructor of a class or enum may have an initializing formal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C1(int v) {
  int v;
}

augment class C1 {
  augment C1(this.v);
}

class C2.foo(int v);

augment class C2 {
  int v;
  augment C2.foo(this.v);
}

enum E(int v) {
  e0(0);
  final int v;
}

augment enum E {
  ;
  augment const E(this.v);
}

main() {
  Expect.equals(1, C1(1).v);
  Expect.equals(2, C2.foo(2).v);
  Expect.equals(0, E.e0.v);
}
