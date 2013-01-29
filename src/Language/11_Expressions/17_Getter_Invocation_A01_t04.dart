/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a getter invocation i of the form e.m proceeds as follows:
 * First, the expression e is evaluated to an object o. Then, the getter function
 * m is looked up in o with respect to the current library, and its body is
 * executed with this bound to o. The value of the getter invocation expression is
 * the result returned by the call to the getter function.
 * @description Checks that a getter can be looked up dynamically.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class S {
  test() {
    Expect.equals(1, a); /// static type warning
  }
}

class C extends S {
  var a;
}

main() {
  var c = new C();
  c.a = 1;
  c.test();
}
