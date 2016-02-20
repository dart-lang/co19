/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement declares a new local variable.
 *   localVariableDeclaration:
 *     initializedVariableDeclaration ’;’
 *   ;.
 * @description Checks that a variable is introduced into the scope after a
 * variable declaration statement is evaluated, and the name of this variable
 * cannot be used in its initialization.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  try {
    var x;
    var f = () {x = f;};
  } catch (x) {}
}
