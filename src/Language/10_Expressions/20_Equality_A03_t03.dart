/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form super == e proceeds as
 * follows:
 * - The expression e is evaluated to an object o.
 * - If this === o evaluates to true, then ee evaluates to true. Otherwise,
 * - If either this or o is null, then ee evaluates to false. Otherwise,
 * - ee is equivalent to the method invocation super.equals(o).
 * @description Checks that if operands are not identical and not [:null:]
 * ee is equivalent to the method invocation super.equals(o2).
 * @author msyabro
 * @reviewer kaigorodov
 * @note issue 1242
 */

class TestException {}

class S {
  operator equals(other) {
    throw new TestException();
  }
}

class A extends S {
  test() {
    try {
      super == 1;
      Expect.fail("operator == was not called");
    } catch(TestException e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
