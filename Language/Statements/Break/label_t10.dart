/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let sb be a break statement. If sb is of the form break L;, then
 * let sE be the the innermost labeled statement with label L enclosing sb. If
 * sb is of the form break;, then let sE be the innermost do, for, switch or
 * while statement enclosing sb. It is a compile-time error if no such statement
 * sE exists within the innermost function in which sb occurs.
 * @description Checks that it is a compile-time error if there's no label with
 * the specified identifier in an enclosing scope.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */


main() {
  try {
    L:
    for (int i in [1,2]) {
    }

    do {
      break L;
    } while (false);
  } catch (x) {}
}
