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
 * in an asynchronous form of 'id in expression' is not a simple variable.
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

class C {
  int i;
}

main() async {
  try {
    C c = new C();
    await for (c.i in new Stream.fromIterable([1,2])) break;
  } catch (x) {}
}
