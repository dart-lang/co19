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
 * @reviewer rodionov
 */

topLevelFunction() {}

class S {
  const S();
  operator+(var x) {}
  operator-(var x) {}
  operator[](var idx) {}
  final foo = 1;
}

class A extends S {
  method() {}
  get id() {}
  set id(var v) {}

  test() {
    //super is a primary
    try {super + 0;} catch(var e) {}
    try {super - super[0];} catch(var e) {}
    try {super + super.foo - [0][1][2][3]; } catch(var e) {}

    // chaining
    try {super + 0 - 1 + {} - null;} catch(var e) {}
    try {0 - 1 + {} - null;} catch(var e) {}

    // (...)
    try {(this) + (1 ^ 0 & 4) - (1 <= 0);} catch(var e) {}

    //literals with selectors
    try {null + 5(); } catch(var e) {}
    try {true[0] + "x".x - [[[0]]].y; } catch(var e) {}

    //constants
    try {const [] + const {};} catch(var e) {}
    try {const ["1", 2] - const S();} catch(var e) {}

    //invocations
    try {method() + topLevelFunction();} catch(var e) {}
    try {this.method()(1)(1, 2) - id[0]().x;} catch(var e) {}

    //multiplicative expressions
    try {true * false + id.id / []();} catch(var e) {}
    try {this[1] % null(1) - topLevelFunction()[0]++ ~/ {}()[0];} catch(var e) {}

    //unary expressions
    try {-this + ~this;} catch(var e) {}
    try {--id - id++;} catch(var e) {}
    try {~-id + !!false;} catch(var e) {}
    try {++1[1] - ()=>2[0]--;} catch(var e) {}

    //identifier
    try {id + id - id;} catch(var e) {}
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
