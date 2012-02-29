/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The for statement supports iteration.
 * forStatement:
 *   for '(' forLoopParts ')' statement
 * ;
 * forLoopParts:
 *   forInitializerStatement expression? ';' expressionList? |
 *   declaredIdentifier in expression |
 *   identifier in expression
 * ;
 * forInitializerStatement:
 *   initializedVariableDeclaration ';' |
 *   expression? ';'
 * ;
 * @description Checks that various valid variations of the for statement
 * do not cause any errors.
 * @author rodionov
 * @reviewer iefremov
 */

bool f() {return true;}

main() {
  var x;
  for(int i = -100; i < 100; i++) break;
  for(int i = 100; i < -100; i++) break;
  for(int i = 100;; i++) break;
  for(int i = 100; i < 101;) break;
  for(int i = 100;;) break;
  for(;;) break;
  for(var f = () => null;;) break;
  for(final f = const [];;) break;
  for(var f = {};;) break;
  for(x = {};;) break;
  for(x = null;;) break;

  int i = 0;
  for(i > 0; i > 0; i > 0, i/2, i > 0, i = 0) break;
  for(i > 0; ; i > 0, i/2, i > 0, i = 0) break;
  
  for(f(); f(); f(), f()) break;
  for(f(); f() ? true : false;) break;
  for(f() ? f() : 25.0; f() ? false : true; 1 ? "foo" : 11, i * 2) break;


}

