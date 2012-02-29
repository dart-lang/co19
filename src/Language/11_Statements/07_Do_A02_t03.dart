/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The do statement supports conditional iteration, where the condition 
 * is evaluated after the loop.
 * Execution of a while statement of the form while (e) s; proceeds as follows:
 * The expression e is evaluated to an object o. In checked mode, it is a dynamic
 * type error if o is not of type bool. Otherwise, o is then subjected to boolean
 * conversion (10.4.1), producing an object r. If r is true, then s is executed and
 * then the while statement is re-executed recursively. If r is false, execution of
 * the while statement is complete.
 * @description Checks that a dynamic type error is produced in checked mode if o is not of type bool.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

main() {
  checkTypeError( () {
    do {
    } while (1);
  });

  checkTypeError( () {
    do {
    } while ("true");
  });
}
