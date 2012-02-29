/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let sc be a continue statement. If sc is of the form continue L;, 
 * then let sE be the the innermost labeled statement or case clause with label L 
 * enclosing sc. If sc is of the form continue; then let sE be the innermost do (11.7),
 * for (11.5) or while (11.6) statement enclosing sc. It is a compile-time error if no
 * such statement or case clause sE exists within the innermost function in which sc occurs.
 * @description Checks that it is not an error when a continue statement in a case clause
 * refers to another case clause of the same switch statement.
 * @author rodionov
 * @reviewer iefremov
 */


main() {
  var flag = false;
  switch(1) {
    case 2:
      continue L;
    L: case 1:
      flag = true;
  }

  Expect.isTrue(flag, "Continue statement should transfer control to a proper case clause!");
}
