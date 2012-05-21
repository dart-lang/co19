/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a throw statement of the form throw e; proceeds as follows:
 * The expression e is evaluated yielding a value v. If v evaluates to null, then a
 * NullPointerException is thrown. Otherwise, control is transferred
 * to the nearest dynamically enclosing exception handler (11.9), with the current
 * exception set to v and the current stack trace set to the series of activations
 * that led to execution of the current function.
 * @description Checks that the statement of the form "throw e;" indeed raises an exception
 * and transfers control to the nearest enclosing exception handler if there is one.
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  bool flag = false;
  var ex = "";
  try {
    foo() {
      try {
        throw ex;
        Expect.fail("This code shouldn't be executed");
      } catch (int i) {}
      Expect.fail("This code shouldn't be executed");
    }
    foo();
    Expect.fail("This code shouldn't be executed");
  } catch (int i) {
  } catch (String s, var st) {
    flag = true;
    Expect.isTrue(ex === s);
    Expect.isNotNull(st);
  } catch (var v) {
    Expect.fail("This code shouldn't be executed");
  }
  
  Expect.isTrue(flag, "The correct exception handler wasn't triggered");
}
