/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Multiplicative expressions invoke the multiplication operators on objects.
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
 * of a multiplicative operator on either super or an expression e1, with argument e2.
 * @description  Checks that various expressions that fit into this grammar
 * don't cause compile-time errors.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

topLevelFunction() {}

class S {
  const S();
  operator*(var x) {}
  operator/(var x) {}
  operator%(var x) {}
  operator~/(var x) {}
}

class A extends S {
  method() {}
  get id() {}
  set id(var v) {}

  test() {
    //super
    try {super * 1;} catch (var ok) {}
    try {super / true;} catch (var ok) {}
    try {super % new S();} catch (var ok) {}
    try {super ~/ [1][0]++;} catch (var ok) {}
    
    // chaining
    try {super * 1 / 2 % 3 ~/ 4 % 5 / 6 * 7;} catch (var ok) {}
    
    //literals with selectors
    try {null * "string"; } catch(var e) {}
    try {this.id * (true(1, 2).val / 1[1]); } catch(var e) {}
    try {1(1, 2)[3] * (null(1, []).val / (1.x % {}["s"])); } catch(var e) {}
    try {"s" * (true / (2 % ([]() ~/ {}))); } catch(var e) {}

    //constants
    try {const [] * const [1];} catch(var e) {}
    try {const {} % const [];} catch(var e) {}
    try {const [1, 2, 3] / const {"1": 1} ~/ const S();} catch(var e) {}

    //invocations
    try {method() * topLevelFunction();} catch(var e) {}
    try {this.method()(1)(1, 2) / id[0]().x;} catch(var e) {}
    try {id % topLevelFunction().x;} catch(var e) {}
    try {method(this) ~/ id[1]();} catch(var e) {}

    //unary expressions
    try {-this * ~this;} catch(var e) {}
    try {--id / id++;} catch(var e) {}
    try {~-id % !!false;} catch(var e) {}
    try {++1[1] ~/ ()=>2[0]--;} catch(var e) {}

    //identifier and chaining
    try {id * id / id % id ~/ id; } catch(var e) {}
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
