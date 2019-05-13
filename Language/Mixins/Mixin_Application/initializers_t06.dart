/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
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
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class A {
  int x1 = 1;

  testA() {
    Expect.equals(1, this.x1);
  }
}

class M {
  int x2 = 2;

  testM() {
    Expect.equals(2, this.x2);
  }
}

typedef AAlias = A;
typedef MAlias = M;

class C extends AAlias with MAlias {
  test() {
    Expect.equals(1, x1);
    Expect.equals(2, x2);
    testM();
    testA();
  }
}


main() {
  C c = new C();
  c.test();
}
