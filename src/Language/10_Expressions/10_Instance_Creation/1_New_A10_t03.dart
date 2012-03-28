/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If q is a redirecting constructor, then: The argument list
 * (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated. Then, the redirect clause
 * of q is executed with respect to the bindings that resulted from the evaluation
 * of the argument list and the type parameters (if any) of C bound to the actual
 * type arguments V1, ... , Vm resulting in an object i that is necessarily the result
 * of another constructor call. The result of the evaluation of e is i.
 * @description Checks the order of a new expression evaluation.
 * @author msyabro
 * @reviewer rodionov
 */

var evalOrder;

f(p1) {
  evalOrder.add(p1);
}

class A {
  logAndAdd2(arg) {
    evalOrder.add(arg);
    return arg + 2;
  }
}

class C {
  C(p1): this.redirected(p1, new A().logAndAdd2(2));
  C.redirected(p1, p2): x = f(p1), y = f(p2) {
    evalOrder.add(5);
  }
  var x;
  var y;
}

main() {
  evalOrder = new StringBuffer();
  new C(new A().logAndAdd2(1));
  Expect.equals("12345", evalOrder.toString());
}
