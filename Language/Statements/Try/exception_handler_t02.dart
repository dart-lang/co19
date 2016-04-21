/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A try statement try s1 on − catch1 ... on − catchn finally sf
 * defines an exception handler h that executes as follows:
 *   The on-catch clauses are examined in order, starting with catch1, until
 * either an on-catch clause that matches the current exception is found,
 * or the list of on-catch clauses has been exhausted. If an on-catch clause
 * on−catchk is found, then pk1 is bound to the current exception, pk2, if
 * declared, is bound to the active stack trace, and then catchk is executed.
 * If no on-catch clause is found, the finally clause is executed. Then,
 * execution resumes at the end of the try statement.
 *   A finally clause finally s defines an exception handler h that executes
 * as follows:
 *   Let r be the current return value. Then the current return value becomes
 * undefined. Any open streams associated with any asynchronous for loops and
 * yield-each statements executing within the dynamic scope of h are canceled,
 * in the order of their nesting, innermost first.
 *   Streams left open by for loops that were escaped for whatever reason would
 * be canceled at function termination, but it is best to cancel them as soon as
 * possible.
 *   Then the finally clause is executed. Let m be the immediately enclosing
 * function. If r is defined then the current return value is set to r and then:
 *  • if there is a dynamically enclosing error handler g defined by a finally
 *    clause in m, control is transferred to g.
 *  • Otherwise m terminates.
 *  Otherwise, execution resumes at the end of the try statement.
 * @description Checks that the finally clause is executed regardless of whether
 * or not a matching catch clause was found and whether or not there were any to
 * begin with. Implicitly checks that execution resumes at the end of the try
 * statement or is transferred to the nearest dynamically enclosing exception
 * handler depending on whether or not the current exception was made undefined
 * by an executed catch clause.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';


void main() {
  bool isFinallyExecuted = false;
  var ex = "fail";
  try {
    try {
      throw ex;
    } on int catch (i) {
    } on bool catch (b) {
    } finally {
      isFinallyExecuted = true;
    }
    Expect.fail("This code shouldn't be executed");
  } on String catch (s) {
    Expect.equals(ex, s);
  }
  Expect.equals(true, isFinallyExecuted);

  isFinallyExecuted = false;
  try {
    throw ex;
  } on int catch (i) {
  } on String catch (s) {
  } on bool catch (b) {
  } finally {
    isFinallyExecuted = true;
  }
  Expect.equals(true, isFinallyExecuted);

  isFinallyExecuted = false;
  try {
    try {
      throw ex;
    } finally {
      isFinallyExecuted = true;
    }
    Expect.fail("This code shouldn't be executed");
  } on String catch (s) {
    Expect.equals(ex, s);
  }
  Expect.equals(true, isFinallyExecuted);
}
