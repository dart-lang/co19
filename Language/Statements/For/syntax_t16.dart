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
 * @description Checks that it is a compile-time error if the loop parts
 * in an asynchronous loop form 'id in expression' contain more than one
 * identifier.
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

main() async {
  try {
    await for (var x, y in new Stream.fromIterable(new List(100))) break;
  } catch (x) {}
}
