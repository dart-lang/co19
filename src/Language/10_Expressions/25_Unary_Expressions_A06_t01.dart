/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expression -super is equivalent to the method invocation super.negate().
 * @description Checks that the expression -super is equivalent to the method invocation super.negate().
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 * @note issue #1288
 */

class TestException {}

class S {
  operator negate() {
    throw new TestException();
  }
}

class A extends S{
  test() {
    try {
      var x = -super;
      Expect.fail("Operator negate was not called");
    } catch(TestException e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
