/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A try statement try s1 on − catch1 . . . on − catchn finally sf defines an
 * exception handler h that executes as follows:
 *   The on-catch clauses are examined in order, starting with catch1 , until
 * either an on-catch clause that matches the current exception (11.8) is found,
 * or the list of on-catch clauses has been exhausted. If an on-catch clause
 * on−catchk is found, then pk1 is bound to the current exception, pk2 , if declared,
 * is bound to the active stack trace, and then catchk is executed. If no on-catch
 * clause is found, the finally clause is executed. Then, execution resumes at the
 * end of the try statement.
 *     A finally clause finally s defines an exception handler h that executes by
 * executing the finally clause. Then, execution resumes at the end of the try
 * statement.
 * @description Checks that if a matching catch clause is found, then the first exception
 * parameter is bound to the current exception and the second to the current stack trace.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

void main() {
  var ex = new Exception("fail");
  try {
    throw ex;
  } on Exception catch(e, st) {
    Expect.equals(ex, e);
    Expect.isTrue(st.toString().contains("Language/12_Statements/10_Try_A07_t03.dart"));
  }
}
