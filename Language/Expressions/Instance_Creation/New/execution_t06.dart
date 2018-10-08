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
 * @description Checks the order of a new expression with named constructor
 * evaluation taking into account the evaluation of the super constructor.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

var evalOrder;

f(p1) {
  evalOrder.write(p1);
}

class A {
  logAndAdd1(arg) {
    evalOrder.write(arg);
    return arg + 1;
  }

  logAndAdd3(arg) {
    evalOrder.write(arg);
    return arg + 3;
  }
}

class S {
  S(p1): x = f(p1) {
    evalOrder.write(5);
  }
  var x;
}

class C extends S {
  C.name(p1):  y = f(p1), super(new A().logAndAdd1(2)) {
    evalOrder.write(6);
  }
  var y;
}

main() {
  evalOrder = new StringBuffer();
  new C.name(new A().logAndAdd3(1));
  Expect.equals("142356", evalOrder.toString());
}
