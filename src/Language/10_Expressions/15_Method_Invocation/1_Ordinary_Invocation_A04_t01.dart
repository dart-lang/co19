/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an ordinary method invocation i of the form o.m(a1, ... , an, xn+1 :
 * an+1, ... , xn+k : an+k) proceeds as follows:
 * First, the expression o is evaluated to a value vo. Next, the argument list
 * (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated yielding actual argument
 * objects o1, ... , on+k. Let f be the result of looking up method m in vo with
 * respect to the current library L. If the method lookup succeeded, the body of f
 * is executed with respect to the bindings that resulted from the evaluation of the
 * argument list, and with this bound to vo. The value of i is the value returned
 * after f is executed.
 * @description Checks that first the expression o is evaluated and then expressions in the argument
 * list in order from left to right.
 * @author msyabro
 * @reviewer kaigorodov
 */

StringBuffer buffer;

class A {
  operator+(otherOperand) {
    buffer.add(2);
    return null;
  }
  operator-(otherOperand) {
    buffer.add(3);
    return null;
  }
}

class B {
  B() {
    buffer.add(5);
  }
}

class C {
  C() {
    buffer.add(4);
  }
}

class O {
  operator+(otherOperand) {
    buffer.add(1);
    return new O();
  }
  method(var a, var b, {var c: null, var d: null}) {}
}

main() {
  buffer = new StringBuffer();
  var o = new O();
  (o + 1).method(new A() + 1, new A() - 2, d: new C(), c: new B());
  Expect.equals("12345", buffer.toString());
}



