/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Additive expressions invoke the addition operators on objects.
 * additiveExpression:
 *   multiplicativeExpression (additiveOperator multiplicativeExpression)* |
 *   super (additiveOperator multiplicativeExpression)+
 * ;
 * additiveOperator:
 *   '+' |
 *   '-'
 * ;
 * An additive expression is either a multiplicative expression, or an
 * invocation of an additive operator on either super or an expression e1, with
 * argument e2.
 * @description Checks that various expressions fitted into this grammar don't
 * cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 */

topLevelFunction() {}

class S {
  const S();
  operator+(var x) {}
  operator-(var x) {}
}

class A extends S {
  method() {}
  get id() {}
  set id(var v) {}

  test() {
    //super
    try {super + 0;} catch(var e) {}
    try {super + (super - [0][1][2][3]); } catch(var e) {}

    //literals with selectors
    try {null  + 5(); } catch(var e) {}
    try {true[0] + ("x".x - [[[0]]].y); } catch(var e) {}

    //constants
    try {const [] + const {};} catch(var e) {}
    try {const ["1", 2] - const S();} catch(var e) {}

    //invocations
    try {method() + topLevelFunction();} catch(var e) {}
    try {this.method()(1)(1, 2) - id[0]().x;} catch(var e) {}

    //assignment and equality
    try {(1[1] = 2) + (1 === 2);} catch(var e) {}
    try {([].x == 3[1]) - (_id() != (id !== 1));} catch(var e) {}

    //logical and relational expressions
    try {(1 < 2) + (true > false ? 1 : id);} catch(var e) {}
    try {(topLevelFunction() && () => 1) / (_id || id);} catch(var e) {}

    //bitwise and shift expressions
    try {(1[1] ^ 2(2)) - (new S() & true);} catch(var e) {}
    try {("s"["t"]("ring") | null) + (1 >> 3);} catch(var e) {}

    //multiplicative expressions
    try {(true * false) + (id.id / []());} catch(var e) {}
    try {(this[1] % null(1)) - ((topLevelFunction()[0]++) ~/ {}()[0]);} catch(var e) {}

    //unary expressions
    try {(-this) + (~this);} catch(var e) {}
    try {(--id) - (id++);} catch(var e) {}
    try {(~-id) + (!!false);} catch(var e) {}
    try {(++1[1]) - (()=>2[0]--);} catch(var e) {}

    //identifier
    try {id + id - id;} catch(var e) {}
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}