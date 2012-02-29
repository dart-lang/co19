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
 * @description Checks that various function expressions that are valid according to the
 * specification don't produce compile-time errors
 * @author kaigorodov
 * @reviewer rodionov
 * @note the test split into t01 and t05
 */

interface I {}

class C implements I {}

typedef int tf(int x, double y);

main() {
  // as right side of an assignment
  var f = void ff() {};
  var f1 = ff1 () {};
  var f2 = ff2 (int k) {};
  var f3 = (bool b) {};
  var g = int gg() => 1;
  var g1 = int gg1() => 1;
  var g2 = int gg2(int k) => k;
  var g3 = (bool b) => !b;
  var interfaceFunc = I ifes(C x, y) => new C();
  var interfaceFunc2 = ifes2(C x, y) => new C();
  var classFunc = C cfes([p1, String p2]) {{var x = 1;}};
  var classFunc2 = cfes2([p1, String p2]) {{var x = 1;}};
  var funcFunc = tf fufu(tf p1, tf p2, [tf p3]) => null;
  var funcFunc1 = fufu2(tf p1, tf p2, [tf p3]) => null;
  
  // as function expression statement
  int fes() {};
  void fes1() {};
  fes2 (int k) {};
  fes3 () => 1;
  () => null;
  () {};
  I i(C x, y) => new C();
  C c([p1, String p2]) {{var x = 1;}};
  tf tf1 (tf p1, tf p2, [tf p3]) => null;
  
  // as an invocation of function expression
  // see test A01/t05
}
