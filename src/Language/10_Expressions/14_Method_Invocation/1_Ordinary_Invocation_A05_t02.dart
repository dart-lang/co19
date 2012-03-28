/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the method lookup has failed, then let g be the result of looking up getter
 * m in vo with respect to L. If the getter lookup succeeded, let vg be the value of
 * the getter invocation o:m. Then let c be the result of looking up method call
 * in vg with respect to the current library L.
 * Next, c is executed with respect to the bindings of the evaluated argument
 * list. The value of i is the value returned after c is executed.
 * If the getter lookup has also failed, then a new instance im of the predefined
 * interface InvocationMirror is created by calling its factory constructor with
 * arguments m, this, [o1, ... , on] and fxn+1 : on+1, ... , xn+k : on+kg. Then the
 * method noSuchMethod() is looked up in o and invoked with argument im, and
 * the result of this invocation is the result of evaluating i.
 * @description Checks that noSuchMethod is called when vg is not a function
 * (doesn't have the method call) and getter is declared implicitly.
 * @author msyabro
 * @needsreview issue 1604
 */

class TestException {}

class A {
  noSuchMethod(funcName, funcArgs) {
    Expect.equals('call', funcName);
    throw new TestException();
  }
}

class C {
  var func;
}

main()  {
  var o = new C();
  o.func = new A();
  try {
    o.func();
    Expect.fail("TestException is expected");
  } catch(TestException e) {}
}