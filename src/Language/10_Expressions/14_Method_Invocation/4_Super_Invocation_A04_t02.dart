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
 * @description Checks the result of invocation if the method noSuchMethod() invoked.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

class S1 {
  noSuchMethod(InvocationMirror im) {
    return "v";
  }
}

class A extends S1 {
  test() {
    Expect.equals("v", super.m());
  }
}

class S2 {
  noSuchMethod(InvocationMirror im) {
    return true;
  }
}

class B extends S2 {
  test() {
    Expect.equals(true, super.m());
  }
}

class S3 {
  noSuchMethod(InvocationMirror im) {
    return 1;
  }
}

class C extends S3 {
  test() {
    Expect.equals(1, super.m());
  }
}

class S4 {
  noSuchMethod(InvocationMirror im) {
    return null;
  }
}

class D extends S4 {
  test() {
    Expect.equals(null, super.m());
  }
}

main()  {
  new A().test();
  new B().test();
  new C().test();
  new D().test();
}
