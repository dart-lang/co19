/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function literal is an object that encapsulates an executable unit of code.
 * functionExpression:
 *   (returnType? identifier)? formalParameterList functionExpressionBody
 * ;
 * functionExpressionBody:
 *   '=>' expression
 *   | block
 * ;
 * @description Checks that various valid function literal invocation expressions 
 * don't produce compile-time errors.
 * @author kaigorodov
 * @reviewer rodionov
 * @note issue 1189
 */

main() {
// as an invocation of function expression
  () {}();
  vf() {}();
  int if1(k) {return k;}();
  int if2(int k) {return k;}();
  (int if3() => 1)();
  (() => 1)();
  I if4(C x, y) => new C()();
  C cf() {}();
  C cf2(C p1, tf p2, [tf p3] => null)();
  tf tf4(tf p1, tf p2, [tf p3]) => null();
}
