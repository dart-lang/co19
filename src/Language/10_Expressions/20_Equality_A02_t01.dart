/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An equality expression of the form e1 == e2 is equivalent
 * to the method invocation e1.==(e2).
 * @description Checks that expression of the form e1 == e2 is equivalent
 * to the method invocation e1.==(e2).
 * @author msyabro
 * @reviewer kaigorodov
 */

class TestException {}

class A {
  operator==(var val) {
    throw new TestException();
  }
}

main() {
  A a = new A();
  try {
    a == 1;
    Expect.fail("operator == was not called");
  } catch(TestException e) {}
}
