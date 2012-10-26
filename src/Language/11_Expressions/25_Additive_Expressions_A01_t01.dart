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
 * @static-warning
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
  get id {}
  set id(var v) {}

  test() {
    //super is a primary
    try {super + 0;} catch(e) {}
    try {super - super[0];} catch(e) {}
    try {super + super.foo - [0][1][2][3]; } catch(e) {}

    // chaining
    try {super + 0 - 1 + {} - null;} catch(e) {}
    try {0 - 1 + {} - null;} catch(e) {}

    // (...)
    try {(this) + (1 ^ 0 & 4) - (1 <= 0);} catch(e) {}

    //literals with selectors
    try {null + 5(); } catch(e) {}
    try {true[0] + "x".x - [[[0]]].y; } catch(e) {}

    //constants
    try {const [] + const {};} catch(e) {}
    try {const ["1", 2] - const S();} catch(e) {}

    //invocations
    try {method() + topLevelFunction();} catch(e) {}
    try {this.method()(1)(1, 2) - id[0]().x;} catch(e) {}

    //multiplicative expressions
    try {true * false + id.id / []();} catch(e) {}
    try {this[1] % null(1) - topLevelFunction()[0]++ ~/ {}()[0];} catch(e) {}

    //unary expressions
    try {-this + ~this;} catch(e) {}
    try {--id - id++;} catch(e) {}
    try {~-id + !!false;} catch(e) {}
    try {++1[1] - ()=>2[0]--;} catch(e) {}

    //identifier
    try {id + id - id;} catch(e) {}
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
