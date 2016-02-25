/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The for statement supports iteration.
 * forStatement:
 *   await? for '(' forLoopParts ')' statement
 * ;
 * forLoopParts:
 *   forInitializerStatement expression? ';' expressionList? |
 *   declaredIdentifier in expression |
 *   identifier in expression
 * ;
 * forInitializerStatement:
 *   initializedVariableDeclaration |
 *   expression? ';'
 * ;
 * @description Checks that it is a compile-time error if the loop variable
 * in a 'id in expression' includes initializer.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  try {
    for (var l = 1 in new List(100)) break;
  } catch (x) {}
}
