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
 * @description Checks that a setter body is executed with [:this:] bound to o.
 * @author msyabro
 * @reviewer rodionov
 * @note setters not mentioned in this particular assertion, but it is in others around it
 * so this omission might be accidental.
 */

class TestException {}

class C {
  C(this.exception);
  
  set v(val) {throw exception;}
  
  var exception;
}

main()  {
  TestException te = new TestException();
  var o = new C(te);
  try {
    o.v = 1;
    Expect.fail("TestException is expected");
  }  on TestException catch(e) {
    Expect.identical(te, e);
  }
}
