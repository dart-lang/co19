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
 * @description Checks that a getter function m is invoked
 * when evaluating a top-level getter invocation of the form m.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class TestException {}

get v {
  throw new TestException();
}

main()  {
  try {
    v;
    Expect.fail("TestException is expected");
  } on TestException catch (e) {}
}
