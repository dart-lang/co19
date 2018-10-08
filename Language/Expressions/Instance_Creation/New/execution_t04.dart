/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Next, q is executed with this bound to i, the type parameters
 * (if any) of R bound to the actual type arguments V1, ..., Vm and the formal
 * parameter bindings that resulted from the evaluation of the argument list.
 * The result of the evaluation of e is i.
 * @description Checks the order of a new expression evaluation
 * taking into account the evaluation of the super constructor:
 * first the argument list of class C is evaluated, then the argument list
 * of superclass S, then the initializer list of S, the initializer list of C,
 * the body of S, the body of C.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

var evalOrder;

f(p1) {
  evalOrder = '$evalOrder$p1';
}

class A {
  logAndAdd1(arg) {
    evalOrder = '$evalOrder$arg';
    return arg + 1;
  }

  logAndAdd3(arg) {
    evalOrder = '$evalOrder$arg';
    return arg + 3;
  }
}

class S {
  S(p1): x = f(p1) {
    evalOrder = "${evalOrder}5";
  }
  var x;
}

class C extends S {
  C(p1): y = f(p1), super(new A().logAndAdd1(2)) {
    evalOrder = "${evalOrder}6";
  }
  var y;
}

main() {
  evalOrder = "";
  new C(new A().logAndAdd3(1));
  Expect.equals("142356", evalOrder);
}
