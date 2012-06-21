/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function literal is an object that encapsulates an executable unit of code.
 * functionExpression:
 *   formalParameterList functionExpressionBody
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

interface I {}
class C implements I{}
typedef tf();

main() {
  () {}();
  vf() {}();
  int if1(k) {return k;}(1);
  int if2(int k) {return k;}(1);
  (int if3() => 1)();
  (() => 1)();
  (I if4(C x, y) => new C())(null, null);
  C cf() {}();
  (C cf2(C p1, tf p2, [tf p3]) => null)(null, null);

  tf tf4(tf p1, tf p2, [tf p3]) => null();
  try {
    (tf tf5(tf p1, tf p2, [tf p3]) => null())(null, null); //null() is parsed as a closure invocation
  } catch(var x){}
}
