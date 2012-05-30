/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For each instance variable f of i, if the variable declaration
 * of f has an initializer, then f is bound to that value
 * (which is necessarily a compile-time constant). Otherwise f is bound to null.
 * Next, the argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is
 * evaluated. Then, q is executed with this bound to i,
 * the type parameters (if any) of C bound to the actual type arguments V1, ..., Vm and
 * the formal parameters of q bound to the corresponding actual arguments.
 * The result of the evaluation of e is i.
 * @description Checks the order of a new expression evaluation: first the
 * initializers in class member variable declarations are evaluated, then the constructor argument list,
 * then the constructor's initializer list, and then the constructor body.
 * @author msyabro
 * @reviewer rodionov
 * @note There seems to be no way to verify that the initializers in class member variable declarations
 * are evaluated first since they have to be compile-time constants and as such cannot modify any outside
 * variables.
 */

var evalOrder;

f(p1) {
  evalOrder = '$evalOrder$p1';
}

class A {
  logAndAdd2(arg) {
    evalOrder = '$evalOrder$arg';
    return arg + 2;
  }
}

class C {
  C(p1, p2): x = f(p1), y = f(p2) {
    evalOrder = "${evalOrder}5";
  }
  var x;
  var y;
}

main() {
  evalOrder = "";
  new C(new A().logAndAdd2(1), new A().logAndAdd2(2));
  Expect.equals("12345", evalOrder);
}
