/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a super method invocation i of the form
 * super.m(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k)
 * proceeds as follows:
 * First, the argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated
 * yielding actual argument objects o1, ... , on+k. Let S be the superclass of
 * the immediately enclosing class, and let f be the result of looking up method m in S with
 * respect to the current library L. If the method lookup succeeded, the body of
 * f is executed with respect to the bindings that resulted from the evaluation of
 * the argument list, and with this bound to the current value of this. The value
 * of i is the value returned after f is executed.
 * @description Checks that the body of f is executed with respect to the bindings
 * that resulted from the evaluation of the argument list.
 * @author msyabro
 * @reviewer kaigorodov
 */

class TestException {}

class S {
  f(var exception) {
    throw exception;
  }
}

class A extends S {
  test() {
    try {
      super.f(new TestException());
      Expect.fail("Exception is expected");
    } catch(TestException e) {}
  }
}

main() {
  new A().test();
}


