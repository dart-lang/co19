/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the method lookup has failed, then let g be the result of looking up getter
 * m in vo with respect to L. If the getter lookup succeeded, let vg be the value of
 * the getter invocation o.m. Then the value of i is the value of the method
 * invocation vg.call(a1, ..., an; xn+1 : an+1, ..., xn+k : an+k).
 * If the getter lookup has also failed, then a new instance im of the predefined
 * interface InvocationMirror is created by calling its factory constructor with
 * arguments m, this, [o1, ..., on] and fxn+1 : on+1, ..., xn+k : on+kg. 
 * Then the method noSuchMethod() is looked up in o and invoked with argument im,
 * and the result of this invocation is the result of evaluating i.
 * @description Checks that noSuchMethod() is called when vg is not a function
 * (doesn't have the method call) and getter is declared implicitly.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

class TestException {}

class A {
  noSuchMethod(Invocation im) {
    Expect.equals('call', im.memberName);
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
  } on TestException catch(e) {}
}
