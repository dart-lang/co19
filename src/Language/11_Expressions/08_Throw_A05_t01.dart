/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an expression of the form throw; proceeds as follows:
 * Control is transferred to the nearest innermost enclosing exception handler (12.10).
 * No change is made to the current exception.
 * @description Checks that an expression statement of the form "throw;" indeed transfers control
 * to the nearest enclosing exception handler if there is one, leaving the current exception
 * and stack trace unchanged.
 * @runtime-error
 * @author rodionov
 * @reviewer iefremov
 * @note with the runtime-error tag, there's hardly any way to make this test fail, since
 * any AssertionErrors are also considered a desired outcome by the harness.
 */
import "../../Utils/expect.dart";

main() {
  try {
    throw "ex";
    Expect.fail("This code shouldn't be executed");
  } on int catch(i) {
  } on String catch (s, st) {
    throw;
    Expect.fail("This code shouldn't be executed");
  }
  Expect.fail("This code shouldn't be executed");
}
