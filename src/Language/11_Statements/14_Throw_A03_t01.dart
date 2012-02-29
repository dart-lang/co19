/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a statement of the form throw; proceeds as follows: Control is
 * transferred to the nearest innermost enclosing exception handler (11.9)
 * It is a compile-time error if a statement of the form throw; is not enclosed within a catch clause.
 * @description Checks that the statement of the form "throw;" indeed transfers control
 * to the nearest enclosing exception handler if there is one, leaving the current exception
 * and stack trace unchanged.
 * @runtime-error
 * @author rodionov
 * @reviewer iefremov
 * @note with the runtime-error tag, there's hardly any way to make this test fail, since
 * any AssertionErrors are also considered a desired outcome by the harness.
 */

main() {
  try {
    throw "ex";
    Expect.fail("This code shouldn't be executed");
  } catch (int i) {
  } catch (String s, var st) {
    throw;
    Expect.fail("This code shouldn't be executed");
  }
  Expect.fail("This code shouldn't be executed");
}
