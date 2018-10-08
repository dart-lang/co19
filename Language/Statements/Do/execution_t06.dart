/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a do statement of the form do s while (e); proceeds
 * as follows:
 *   The statement {s} is executed. Then, the expression e is evaluated to an
 * object o. Then, o is then subjected to boolean conversion, producing an
 * object r. If r is false, execution of the do statement is complete. If r is
 * true, then the do statement is re-executed recursively.
 * @description Check that AssertionError is thrown if e evaluates to null
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  int x = 0;
  try {
    do {
      x = 2;
    } while (null);
    Expect.fail("AssertionError is expected");
  } on AssertionError {
    // ok
  }
}
