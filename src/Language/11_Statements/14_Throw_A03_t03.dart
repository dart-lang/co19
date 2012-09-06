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
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  bool flag = false;
  var strace;
  var ex = "";
  
  try {
    try {
      void foo() {
        try {
          throw ex;
          Expect.fail("This code shouldn't be executed");
        } on int catch(i) {
        } catch (var v, var st) {
          strace = st;
          throw;
          Expect.fail("This code shouldn't be executed");
        }
        Expect.fail("This code shouldn't be executed");
      }
      foo();
      Expect.fail("This code shouldn't be executed");
    } on int catch(i) {}
    Expect.fail("This code shouldn't be executed");
  } on int catch(i) {
  } catch (String s, var st) {
    flag = true;
    Expect.isTrue(ex === s);
    Expect.isTrue(strace === st);
  } catch(v) {
    Expect.fail("This code shouldn't be executed");
  }
  
  Expect.isTrue(flag, "The correct exception handler wasn't triggered");
}
