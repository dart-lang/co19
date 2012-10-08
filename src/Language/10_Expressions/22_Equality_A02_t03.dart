/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form e1 == e2 proceeds as
 * follows:
 * - The expression e1 is evaluated to an object o1.
 * - The expression e2 is evaluated to an object o2.
 * - If o1 === o2 evaluates to true, then ee evaluates to true. Otherwise,
 * - If either o1 or o2 is null, then ee evaluates to false. Otherwise,
 * - ee is equivalent to the method invocation o1.equals(o2).
 * @description Checks that if one of operands is null, the result of an
 * equality expression is false.
 * @author msyabro
 * @reviewer iefremov
 */

class C {
  operator equals(other) {
    throw 'This operator should not be invoked.';
  }
}

foo() {}

main() {
  var o = new Object();

  Expect.isFalse(null == "null");
  Expect.isFalse(null == new Object());
  Expect.isFalse([1, 2, 3] == null);
  Expect.isFalse(null == const {'1': 1});
  Expect.isFalse(1 == null);
  Expect.isFalse(false == null);
  Expect.isFalse(new C() == null);
  Expect.isFalse(foo == null);
  Expect.isFalse(null == foo);
}
