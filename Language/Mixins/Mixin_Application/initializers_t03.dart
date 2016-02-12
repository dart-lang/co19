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
 * and initialize corresponding fields of the class C.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class A {
  int x;

  testA() {
    Expect.equals(1, this.x);
  }
}

class M {
  int x = 1;

  testM() {
    Expect.equals(1, this.x);
  }
}

class C extends A with M {
  test() {
    Expect.equals(1, x);
    testM();
    testA();
  }
}


main() {
  C c = new C();
  c.test();
}
