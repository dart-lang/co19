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
 * @description Checks that various valid variations of the for statement
 * do not cause any errors.
 * @author rodionov
 * @reviewer iefremov
 * @reviewer msyabro
 */

bool f() {return true;}

main() {
  var x;
  for (int i = -100; i < 100; i++) break;
  for (int i = 100; i < -100; i++) break;
  for (int i = 100;; i++) break;
  for (int i = 100; i < 101;) break;
  for (int i = 100;;) break;
  for (;;) break;
  for (var y = () => null;;) break;
  for (var y = () {for (;;) break;} ;;) break;
  for (final y = const [];;) break;
  for (var y = {};;) break;
  for (x = {};;) break;
  for (x = null;;) break;

  int i = 0;
  for (i > 0; i > 0; i > 0, i/2, i > 0, i = 0) break;
  for (i > 0; ; i > 0, i/2, i > 0, i = 0) break;

  for (f(); f(); f(), f()) break;
  for (f(); f() ? true : false;) break;
  for (f() ? f() : 25.0; f() ? false : true; false ? "foo" : 11, i * 2) break;

  //foreach
  for (var i in [1, 2]) {break;}
  for (int i  in [1, 2]) break;
  for (final i in const []) break;
  for (final String s in ['a', 'b', 'c']) {break;}
  for (i in const [1, 2, 3, 4, 5]) break;  //i is declared earlier
}
