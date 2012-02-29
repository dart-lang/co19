/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If getter lookup has also failed, then a new instance im of the predefined
 * interface InvocationMirror is created by calling its factory constructor with
 * arguments m, this, [o1, ... , on] and fxn+1 : on+1, ... , xn+k : on+kg. Then the
 * method noSuchMethod() is looked up in S and invoked with argument im, and
 * the result of this invocation is the result of evaluating i.
 * @description Checks that noSuchMethod is invoked if method and getter lookups have failed.
 * @author msyabro
 * @needsreview Issue 1244
 */

class TestException {}

class S {
  noSuchMethod(var name, var argList) {
    throw new TestException();
  }
}

class A extends S {
  test() {
    try {
      super.nonExistingMethod();
      Expect.fail("Exception is expected");
    } catch(TestException e) {}
  }
}

main()  {
  new A().test();
}