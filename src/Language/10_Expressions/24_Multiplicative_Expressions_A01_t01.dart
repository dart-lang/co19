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
 * @author msyabro
 * @reviewer kaigorodov
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
    super * 1;
    super * (super / true);
    super * (super / (super % new S()));
    super * (super / (super % (super ~/ [1][0]++)));

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
    try {(id = 1) % topLevelFunction().x;} catch(var e) {}
    try {method(this) ~/ id[1]();} catch(var e) {}

    //assignment and equality
    try {(1[1] = 2) * (1 === 2);} catch(var e) {}
    try {([].x == 3[1]) / (_id() != (id !== 1));} catch(var e) {}
    try {(7.x[7] = [1](1).x) % ({}.x = [].y);} catch(var e) {}
    try {(_id = 1) ~/ (_id = 2);} catch(var e) {}

    //logical and relational expressions
    try {(1 < 2) * (true > false ? 1 : id);} catch(var e) {}
    try {(topLevelFunction() <= () => 1) / (_id && id);} catch(var e) {}
    try {([] || {}) % (2 > true);} catch(var e) {}
    try {([]()[1]()[2] >= {}[1](2)) ~/ (const S() || new S());} catch(var e) {}

    //bitwise and shift expressions
    try {( 1 & 2) * ( 3 | 4);} catch(var e) {}
    try {(1[1] ^ 2(2)) / (new S() & true);} catch(var e) {}
    try {("s"["t"]("ring") | null) % (this >> this);} catch(var e) {}
    try {(const [] >> {}) ~/ (1 << 1);} catch(var e) {}

    //additive expressions
    try {(1 + 1) * (true - false);} catch(var e) {}
    try {(1 + -1) / ((2 - -3) % ([] + 1));} catch(var e) {}
    try {(method() + id[1]) ~/ (const {} - (1 >> ""));} catch(var e) {}

    //unary expressions
    try {(-this) * (~this);} catch(var e) {}
    try {(--id) / (id++);} catch(var e) {}
    try {(~-id) % (!!false);} catch(var e) {}
    try {(++1[1]) ~/ (()=>2[0]--);} catch(var e) {}

    //identifier
    try {id * id / id % id ~/ id; } catch(var e) {}
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}