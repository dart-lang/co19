/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an exception is raised during execution of an on-catch clause,
 * this will transfer control to the handler for the finally clause, causing
 * the finally clause to execute in this case as well.
 *   If no exception was raised, the finally clause is also executed. Execution
 * of the finally clause could also raise an exception, which will cause
 * transfer of control to the next enclosing handler.
 * @description Checks that a throw statement inside a finally clause replaces
 * the current exception and unwinds the call stack from the new location.
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

foo() {
  try {
    throw 42;
  } finally {
    throw true;
  }
}

main() {
  try {
    foo();
    Expect.fail("Expected exception thrown from a finally clause!");
  } on int catch (e) {
    Expect.fail("A finally clause was not executed properly!");
  } on bool catch (b) {
    Expect.isTrue(b, "Wrong object was thrown!");
  }
}
