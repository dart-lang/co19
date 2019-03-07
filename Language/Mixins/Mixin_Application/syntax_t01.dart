/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be a class, M be a mixin with required superinterfaces
 * T1, . . . , Tn, combined superinterface MS, implemented interfaces
 * I1, . . . , Ik and members as mixin member declarations, and let N be a name.
 * ...
 * The mixin application of M to S with name N introduces a new class, C,
 * with name N, superclass S, implemented interface I1, . . . , Ik and members
 * as instance members.
 * @description Checks that instance class has the same instance getters as
 * its mixins
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class A {
  int get ga => 0;
}

class M1 {
  int get gm1 => 1;
}

class M2 {
  int get gm2 => 2;
}

class B1 = A with M1;
class B2 = A with M1, M2;
class B3 = B1 with M2;

main() {
  B1 b1 = new B1();
  B2 b2 = new B2();
  B3 b3 = new B3();

  Expect.equals(0, b1.ga);
  Expect.equals(0, b2.ga);
  Expect.equals(0, b3.ga);

  Expect.equals(1, b1.gm1);
  Expect.equals(1, b2.gm1);
  Expect.equals(1, b3.gm1);

  Expect.equals(2, b2.gm2);
  Expect.equals(2, b3.gm2);
}
