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
 * @description Checks that the operator returns false if operands are not equal.
 * @author iefremov
 * @reviewer pagolubev
 */

class A {
  A(this.x) {}
  int x;
}

class B {
  B() {}
}


main() {
  Expect.isTrue(!(12 == "12"));
  Expect.isTrue(!(new A(1) == new A(1)));
  Expect.isTrue(!(new B() == new B()));
  Expect.isTrue(!(new B() == new A(1)));
  Expect.isTrue(!(true == false));
  Expect.isTrue(!(false == true));
  Expect.isTrue(!(new B() == null));
  Expect.isTrue(!(0 == null));
}
