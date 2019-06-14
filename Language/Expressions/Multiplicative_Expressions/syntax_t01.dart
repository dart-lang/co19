/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Multiplicative expressions invoke the multiplication operators on
 * objects.
 * multiplicativeExpression:
 *   unaryExpression (multiplicativeOperator unaryExpression)* |
 *   super (multiplicativeOperator unaryExpression)+
 * ;
 * multiplicativeOperator:
 *   '*' |
 *   '/' |
 *   '%' |
 *   '~/'
 * ;
 * A multiplicative expression is either a unary expression, or an invocation
 * of a multiplicative operator on either super or an expression e1, with
 * argument e2.
 * @description  Checks that various expressions that fit into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 */

topLevelFunction() {}

class S {
  const S();
  operator *(var x) {}
  operator /(var x) {}
  operator %(var x) {}
  operator ~/(var x) {}
}

class A extends S {
  method() {}
  get id {}
  set id(var v) {}

  test() {
    //super
    try {super * 1;} catch (ok) {}
    try {super / true;} catch (ok) {}
    try {super % new S();} catch (ok) {}
    try {super ~/ [1][0]++;} catch (ok) {}

    // chaining
    try {super * 1 / 2 % 3 ~/ 4 % 5 / 6 * 7;} catch (ok) {}

    //invocations
    try {method() * topLevelFunction();} catch (e) {}
    try {this.method()(1)(1, 2) / id[0]().x;} catch (e) {}
    try {id % topLevelFunction().x;} catch (e) {}

    //unary expressions
    try {--id / id++;} catch (e) {}
    try {~-id % !!false;} catch (e) {}

    //identifier and chaining
    try {id * id / id % id ~/ id; } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
