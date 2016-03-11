/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let sc be a continue statement. If sc is of the form continue L;,
 * then let sE be the the innermost labeled do, for or while statement or case
 * clause with label L enclosing sc. If sc is of the form continue; then let sE
 * be the innermost do, for or while statement enclosing sc.
 * It is a compile-time error if no such statement or case clause sE exists
 * within the innermost function in which sc occurs.
 * @description Checks that it is a compile-time error if a 'continue L;'
 * statement occurs in a local function declared in a 'while' statement with
 * label L and there is no inclosing statement with label L in this local
 * function.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  try {
    var counter = 0;
    L: while (counter < 7) {
      counter++;
      if (counter == 3) {
        foo() {
          continue L;
        }
        foo();
      }
    }
  } catch (x) {}
}
