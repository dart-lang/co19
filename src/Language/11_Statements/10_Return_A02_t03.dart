/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Executing a return statement "return e;" first causes evaluation 
 * of the expression e, producing an object o. Next, control is transferred 
 * to the caller of the current function activation, and the object o is provided 
 * to the caller as the result of the function call.
 * @description Checks that a finally statement is executed if the control
 * is transferred from a try block using a return statement.
 * @author iefremov
 * @needsreview issue 1795
 */


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
