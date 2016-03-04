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
 * @description Checks that when another exception is raised in a catch clause,
 * the finally clause of the same try statement is still executed, other catch
 * clauses of that try statement aren't, and control is transferred to the
 * nearest enclosing exception handler afterwards.
 * @author rodionov
 * @reviewer iefremov
 * @note issue 430
 */
import '../../../Utils/expect.dart';

void main() {
  bool flag = false;

  var exStr = "foo", exInt = 2;
  try {
    try {
      throw exStr;
    } on String catch (s) {
      throw exInt;
    } on int catch (i) {
      Expect.fail("This code shouldn't be executed");
    } catch (v) {
      Expect.fail("This code shouldn't be executed");
    } finally {
      flag = true;
    }
  } on int catch (ok) {
    Expect.equals(exInt, ok);
  }

  Expect.isTrue(flag);
}
