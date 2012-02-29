/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expression  e is equivalent to the method invocation e.negate().
 * @description Checks that the expression  e is equivalent to the method invocation e.negate().
 * @author msyabro
 * @reviewer kaigorodov
 */

class TestException {}

class A {
  operator negate() {
    throw new TestException();
  }
}

main() {
  A a = new A();
  try {
    -a;
    Expect.fail("Operator negate was not called");
  } catch(TestException e) {}
}