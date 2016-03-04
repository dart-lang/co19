/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Executing a return statement return e; proceeds as follows:
 * First the expression e is evaluated, producing an object o. Next:
 * • The current return value is set to o and the current exception and active
 *   stack trace become undefined.
 * • Let c be the finally clause of the innermost enclosing try-finally
 *   statement, if any. If c is defined, let h be the handler induced by c. If
 *   h is defined, control is transferred to h.
 * • Otherwise execution of the current method terminates.
 * @description Checks that a finally statement is executed if the control
 * is transferred from a try block using a return statement.
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

foo() {
  try {
    return 1;
  } finally {
    return 2;
  }
}

main() {
  Expect.equals(2, foo(), "A finally clause was not executed correctly!");
}
