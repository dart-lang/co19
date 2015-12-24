/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a top-level getter invocation i of the form m,
 * where m is an identifier, proceeds as follows:
 * The getter function m is invoked. The value of i is the result returned by
 * the call to the getter function.
 * @description Checks that a setter function m is invoked
 * when evaluating a top-level setter invocation of the form m = e.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class TestException {}

set v(val) {
  throw new TestException();
}

main()  {
  try {
    v = 1;
    Expect.fail("TestException is expected");
  } on TestException catch (e) {}
}
