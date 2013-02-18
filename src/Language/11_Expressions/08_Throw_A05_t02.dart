/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an expression of the form throw; proceeds as follows:
 * Control is transferred to the nearest innermost enclosing exception handler (12.10).
 * No change is made to the current exception.
 * @description Checks that the statement of the form "throw;" indeed transfers control
 * to the nearest enclosing exception handler if there is one, leaving the current exception
 * and stack trace unchanged.
 * @author rodionov
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

main() {
  bool flag = false;
  var strace;
  var ex = "";
  
  try {
    try {
      throw ex;
      Expect.fail("This code shouldn't be executed");
    } on int catch(i) {
    } catch(v, st) {
      strace = st;
      throw;
      Expect.fail("This code shouldn't be executed");
    }
    Expect.fail("This code shouldn't be executed");
  } on int catch(i) {
  } catch (s, st) {
    flag = true;
    Expect.isTrue(identical(ex, s));
    Expect.isTrue(identical(strace, st));
  }
  
  Expect.isTrue(flag, "The correct exception handler wasn't triggered");
}
