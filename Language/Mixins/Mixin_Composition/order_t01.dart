// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If there is more than one mixin (n > 1), then let X be the class
/// defined by S with M1, ..., Mn−1 with name F, where F is a fresh name, and
/// make X abstract. Then S with M1, ..., Mn defines the class yielded by the
/// mixin application of the mixin of Mn to the class X with name N.
///
/// @description Checks that mixin composition applies mixins in the right
/// order
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class A {
  int m = 0;
}

mixin class M1 {
  int m = 1;
}

mixin class M2 {
  int m = 2;
}

mixin class M3 {
  int m = 3;
}

class B1 = A with M1, M2;
class B2 = A with M1, M2, M3;
class B3 = B1 with M3, M2, M1;

main() {
  B1 b1 = new B1();
  B2 b2 = new B2();
  B3 b3 = new B3();

  Expect.equals(2, b1.m);
  Expect.equals(3, b2.m);
  Expect.equals(1, b3.m);
}
