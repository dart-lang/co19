/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Shift expressions invoke the shift operators on objects.
 * shiftExpression:
 *   additiveExpression (shiftOperator additiveExpression)* |
 *   super (shiftOperator additiveExpression)+
 * ;
 * shiftOperator:
 *   '<<' |
 *   '>>' |
 *   '>>>'
 * ;
 * A shift expression is either an additive expression, or an invocation
 * of a shift operator on either super or an expression e1, with argument e2.
 * @description Checks that various expressions fitted into this grammar
 * don't cause compile-time errors.
 * $Issue #36343
 * @author msyabro
 */
// SharedOptions=--enable-experiment=triple-shift

topLevelFunction() {}

class S {
  const S();
  operator <<(var v) {}
  operator >>(var v) {}
  operator >>>(var v) {}
}

class A extends S {
  method() {}
  get id {}
  set id(var v) {}

  test() {
    //super
    super << 1;
    super >>> 2;

    super << (super >> []);
    super << (super >>> []);

    //literal with selector is a postfix expr. is an additive expr.
    try {null >> false;} catch (e) {}

    //literal with selector is a postfix expr. is an additive expr.
    try {null >>> false;} catch (e) {}

    //invocation is a postfix expr. is an additive expr.
    try {method() >> topLevelFunction();} catch (e) {}
    try {1 << method()()();} catch (e) {}
    try {method() >> [1, 2];} catch (e) {}
    try {method() >>> [2];} catch (e) {}

    //additive expressions
    try { 1 + 2 << 2;} catch (e) {}
    try { 0 - 0 >> null + null;} catch (e) {}

    try { 0 - 0 >>> 14 + null;} catch (e) {}

    //unary expressions
    try {--id << id++;} catch (e) {}
    try {~-id << !!false;} catch (e) {}
    try {~-id >> !!false;} catch (e) {}
    try {~-id >>> true;} catch (e) {}

    //function expression is a primary is an additive expr.
    try { ()=>0 >> 1; } catch (e) {}
    try { ()=>1 << 1; } catch (e) {}
    try { ()=>11 >>> 1; } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
