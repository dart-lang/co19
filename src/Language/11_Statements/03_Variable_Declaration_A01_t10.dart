/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement declares a new local variable.
 *   localVariableDeclaration:
 *     initializedVariableDeclaration ’;’ .
 * @description Checks that a variable is introduced into the scope
 * after a variable declaration statement is evaluated and it is a NoSuchMethodError
 * when the variable is referenced in the right-hand part of its own declaration in a top-level
 * function context
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    int i = i;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
}
