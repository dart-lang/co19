/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the getter lookup has also failed,  then a new instance im
 * of the predefined interface InvocationMirror is created  by calling its factory constructor
 * with arguments ‘m’,  this, [e1, …, en] and {xn+1:en+1, …, xn+k : en+k}. Then the
 * method noSuchMethod() is looked up in S and invoked with argument im, and
 * the result of this invocation is the result of evaluating i.
 * @description Checks that noSuchMethod is invoked if there's a static method named m
 * in the invoking class's superclass.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class TestException {}

class S {
  static sm() {}
  
  noSuchMethod(InvocationMirror im) {
    throw new TestException();
  }
}

class A extends S {
  test() {
    try {
      super.sm();
      Expect.fail("TestException is expected");
    } on TestException catch(e) {}
  }
}

main()  {
  new A().test();
}
