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
 * @description Checks that a getter body is executed with [:this:] bound to o.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class TestException {}

class C {
  C(this.exception);
  
  var exception;

  get v {throw exception;}
}

main()  {
  TestException te = new TestException();
  var o = new C(te);
  try {
    o.v;
    Expect.fail("TestException is expected");
  } on TestException catch(e) {
    Expect.identical(te, e);
  }
}
