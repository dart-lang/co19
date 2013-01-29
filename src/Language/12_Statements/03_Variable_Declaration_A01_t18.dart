/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement declares a new local variable.
 *   localVariableDeclaration:
 *     initializedVariableDeclaration ’;’ .
 * @description Checks that the variable created by such statement is not
 * available in a scope that encloses the one it was declared in.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  try {
    {
      var id;
    }
    id = null; /// static type warning
    Expect.fail("NoSuchMethodError expected when calling undefined setter.");
  } on NoSuchMethodError catch (ex) {}
}
