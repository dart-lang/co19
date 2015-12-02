/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function literal is an object that encapsulates an executable
 * unit of code.
 * functionExpression:
 *   formalParameterList functionExpressionBody
 * ;
 * @description Checks that various function expressions that are valid
 * according to the specification don't produce compile-time errors.
 * @author kaigorodov
 * @reviewer rodionov
 * @note the test split into t01 and t05
 */

abstract class I {}

class C implements I {}

typedef int tf(int x, double y);

main() {
  // as right side of an assignment
  var f = () {};
  var f2 = (int k) {};
  var g = () => 1;
  var g2 = (int k) => k;
  var interfaceFunc = (C x, y) => new C();
  var classFunc = ([p1, String p2]) {var x = p2;};
  var funcFunc = (tf p1, tf p2, [tf p3]) => null;
  var funcFunc1 = (tf p1, tf p2, {tf p3}) => null;

  // as function expression statement
  () {};
  (int k) {};
  () => 1;
  (C x, y) => new C();
  ([p1, String p2]) {{var x = 1;}};
  (tf p1, tf p2, [tf p3]) => null;

  // as an invocation of function expression
  // see test A01/t05
}
