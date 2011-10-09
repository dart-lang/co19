/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion x == y returns whether x and y are the same value.
 * x == y returns true when x === y returns true or when x and y represent the same value. 
 * An exception to this is if either side of == evaluates to the double value NaN,
 * the result is false.
 * @description Checks that the operator returns true when operands are identical.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  A(this.x) {}
  int x;
}


void main() {
  Expect.isTrue(12 == 12);
  Expect.isTrue(const A(1) == const A(1));
  var a1 = new A(1);
  Expect.isTrue(a1 == a1);
  var a2 = a1;
  Expect.isTrue(a1 == a2);
  Expect.isTrue(a2 == a1);
  var a3 = a2;
  Expect.isTrue(a1 == a3);

  Expect.isTrue(null == null);
  Expect.isTrue(true == true);
  Expect.isTrue(false == false);

  Expect.isTrue("F1" == "F" + 1);
}
