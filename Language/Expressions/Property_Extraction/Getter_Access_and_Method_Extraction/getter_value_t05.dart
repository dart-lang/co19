/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, the body of f is executed with this bound to o. The
 * value of i is the result returned by the call to the getter function.
 * @description Checks that a getter body is executed with this bound to o.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class TestException {}

class C {
  var exception;

  C(this.exception);

  get v {
    throw exception;
  }
}

main()  {
  TestException te = new TestException();
  var o = new C(te);
  try {
    o.v;
    Expect.fail("TestException is expected");
  } on TestException catch (e) {
    Expect.identical(te, e);
  }
}
