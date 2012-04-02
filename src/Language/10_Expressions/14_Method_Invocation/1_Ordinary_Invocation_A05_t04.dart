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
 * If getter lookup has also failed, then a new instance im  of the predefined interface
 * InvocationMirror is created by calling its factory constructor with arguments
 * ‘m’,  this, [o1, …, on] and {xn+1:on+1, …, xn+k : on+k}. Then the
 * method noSuchMethod() is looked up in o and invoked with argument im, and
 * the result of this invocation is the result of evaluating i.
 * @description Checks that the value of method invocation is the value returned by function vg.
 * @author msyabro
 * @reviewer kaigorodov
 */

f1() {
  return "v";
}

f2() {
  return false;
}

f3() {
  return 1;
}

f4() {
  return null;
}

class C {
  var func;
}

main()  {
  var o = new C();
  o.func = f1;
  Expect.equals("v", o.func());

  o.func = f2;
  Expect.equals(false, o.func());

  o.func = f3;
  Expect.equals(1, o.func());

  o.func = f4;
  Expect.equals(null, o.func());
}