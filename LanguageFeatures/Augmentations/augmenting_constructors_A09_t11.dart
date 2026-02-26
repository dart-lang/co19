// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that an augmentation of an incomplete primary
/// constructor of a class or an enum may have an initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C1(int x) {}

augment class C1 {
  int y;
  augment C1(int x) : y = x;
}

class C2.foo(int v);

augment class C2 {
  augment C2.foo(int v) : assert(v > 0);
}

enum E1(int x) {
  e0(0);
}

augment enum E1 {
  ;
  final int y;
  augment const E1(int x) : y = x;
}

enum E2.foo(int v) {
  e0.foo(0);
}

augment enum E2 {
  ;
  augment const E2.foo(int v) : assert(v > 0);
}

main() {
 Expect.equals(1, C1(1).y);
 C2.foo(2);
 Expect.equals(0, E1.e0.y);
 E2.e0;
}
