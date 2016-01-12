/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an unconditional ordinary method invocation i of
 * the form o.m(a1 , ..., an , xn+1 : an+1 , ..., xn+k : an+k)
 * proceeds as follows:
 * First, the expression o is evaluated to a value vo. Next, the argument list
 * (a1, ..., an, xn+1 : an+1, ..., xn+k : an+k) is evaluated yielding actual
 * argument objects o1, ..., on+k. Let f be the result of looking up method m
 * in vo with respect to the current library L.
 * Let p1 ... ph be the required parameters of f, let p1 ... pm be the
 * positional parameters of f and let ph+1, ..., ph+l be the named parameters
 * declared by f.
 * If n < h, or n > m, the method lookup has failed. Furthermore, each
 * xi , n + 1 <= i <= n + k, must have a corresponding named parameter in the
 * set {ph+1 , ..., ph+l} or the method lookup also fails. If vo is an instance
 * of Type but o is not a constant type literal, then if m is a method that
 * forwards to a static method, method lookup fails. Otherwise method lookup
 * has succeeded.
 * If the method lookup succeeded, the body of f is executed with respect to
 * the bindings that resulted from the evaluation of the argument list, and
 * with this bound to vo. The value of i is the value returned after f is
 * executed.
 * @description Checks that first the expression o is evaluated and then
 * expressions in the argument list in order from left to right.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

StringBuffer buffer;

class A {
  operator +(otherOperand) {
    buffer.write(2);
    return null;
  }
  operator -(otherOperand) {
    buffer.write(3);
    return null;
  }
}

class B {
  B() {
    buffer.write(5);
  }
}

class C {
  C() {
    buffer.write(4);
  }
}

class O {
  operator +(otherOperand) {
    buffer.write(1);
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



