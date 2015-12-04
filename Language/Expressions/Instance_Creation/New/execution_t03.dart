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
 * @description Checks the order of a new expression evaluation: first the
 * initializers in class member variable declarations are evaluated, then the
 * constructor argument list, then the constructor's initializer list, and
 * then the constructor body.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

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
