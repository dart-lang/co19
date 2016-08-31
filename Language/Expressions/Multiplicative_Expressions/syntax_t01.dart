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
 * @reviewer kaigorodov
 * @reviewer rodionov
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
    super * 1;
    super / true;
    super % new S();
    super ~/ [1][0]++;

    // chaining
    super * 1 / 2 % 3 ~/ 4 % 5 / 6 * 7; /// 01: runtime error

    //literals with selectors
    null * "string"; /// 02: runtime error
    this.id * (true(1, 2).val / 1[1]); /// 03: static type warning, runtime error
    1(1, 2)[3] * (null(1, []).val / (1.x % {}["s"])); /// 04: static type warning, runtime error
    "s" * (true / (2 % ([]() ~/ {}))); /// 05: static type warning, runtime error

    //constants
    const [] * const [1]; /// 06: static type warning, runtime error
    const {} % const []; /// 07: static type warning, runtime error
    const [1, 2, 3] / const {"1": 1} ~/ const S(); /// 08: static type warning, runtime error

    //invocations
    method() * topLevelFunction(); /// 09: runtime error
    this.method()(1)(1, 2) / id[0]().x; /// 10: runtime error
    id % topLevelFunction().x; /// 11: runtime error
    method(this) ~/ id[1](); /// 12: static type warning, runtime error

    //unary expressions
    -this * ~this; /// 13: static type warning, runtime error
    --id / id++; /// 14: runtime error
    ~-id % !!false; /// 15: runtime error
    ++1[1] ~/ ()=>2[0]--; /// 16: static type warning, runtime error

    //identifier and chaining
    id * id / id % id ~/ id; /// 17: runtime error
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
