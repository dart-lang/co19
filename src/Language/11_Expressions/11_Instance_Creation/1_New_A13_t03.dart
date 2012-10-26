/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, the argument list (a1, ..., an, xn+1: an+1, ..., xn+k: an+k )
 * is evaluated. Then, the body of q is executed with respect to the bindings that
 * resulted from the evaluation of the argument list and the type parameters (if
 * any) of q bound to the actual type arguments V1, ..., Vm resulting in an object i.
 * The result of the evaluation of e is i.
 * @description Checks the order of a new expression evaluation.
 * @author msyabro
 * @reviewer rodionov
 */

var evalOrder;

class A {
  logAndAdd2(arg) {
    evalOrder.add(arg);
    return arg + 2;
  }
}

abstract class I {
  factory I(p1, p2) {
    return new F(p1, p2);
  }
}

class F implements I {
  F(p1, p2) {
    evalOrder.add(3);
  }
}

main() {
  evalOrder = new StringBuffer();
  new I(new A().logAndAdd2(1), new A().logAndAdd2(2));
  Expect.equals("123", evalOrder.toString());
}
