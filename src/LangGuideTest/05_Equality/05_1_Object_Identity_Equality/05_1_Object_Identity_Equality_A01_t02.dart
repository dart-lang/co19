/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator === only tests for object identity.
 * @description Checks the operator on non-identical operands (possibly equal).
 * @author iefremov
 */

class A {
  A() {}
}

class B {
  B() {}
  operator ==(var b) {
    return true;
  }
}


main() {
  Expect.isTrue(!(12 === 12.0));
  Expect.isTrue(!([1, 2] === [1, 2]));
  A a1 = new A();
  A a2 = new A();
  Expect.isTrue(!(a1 === a2));
  Expect.isTrue(!(a2 === a1));
  Expect.isTrue(!(new B() === new B()));
  Expect.isTrue(!(a1 === new B()));

  Expect.isTrue(!(true === false));
  Expect.isTrue(!(false === true));

  Expect.isTrue(!(false === null));
  Expect.isTrue(!(a1 === null));
  Expect.isTrue(!(null === a1));
  Expect.isTrue(!(null === false));
}
