/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If any of the instance fields of M (respectively, Mk) have
 * initializers, they are executed in the scope of M (respectively, Mk) to
 * initialize the corresponding fields of C.
 * @description Checks that if mixins have initializers then they are executed
 * and initialize corresponding fields of the class
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class A {
  int _xa = 0;
  int get x => _xa;
}

class M1 {
  int _xm1 = 1;
  int get x => _xm1;
}

class M2 {
  int _xm2 = 2;
  int get x => _xm2;
}

class B1 = A with M1;
class B2 = A with M1, M2;
class B3 = B1 with M2;

main() {
  B1 b1 = new B1();
  B2 b2 = new B2();
  B3 b3 = new B3();

  Expect.equals(1, b1.x);
  Expect.equals(2, b2.x);
  Expect.equals(2, b3.x);
}
