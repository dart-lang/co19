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
 *   '>>'
 * ;
 * A shift expression is either an additive expression, or an invocation
 * of a shift operator on either super or an expression e1, with argument e2.
 * @description Checks that various expressions fitted into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Issue 1189.
 */

topLevelFunction() {}

class S {
  const S();
  operator<<(var v) {}
  operator>>(var v) {}
}

class A extends S {
  method() {}
  get id() {}
  set id(var v) {}

  test() {
    //super
    super << 1;
    super << (super >> []);

    //literal with selector is a postfix expr. is an addtive expr.
    try {1()[0] << "string".string;} catch(e) {}
    try {true >> {"key1": 0, "key2": 1};} catch(e) {}
    try {null >> false;} catch(e) {}

    //constant literal is a primary is an additive expr.
    try {const [] >> const {};} catch(e) {}
    try {const ["1", 2] << const S();} catch(e) {}
    try {const [] >> 1;} catch(e) {}

    //invocation is a postfix expr. is an additive expr.
    try {method() >> topLevelFunction();} catch(e) {}
    try {1 << method()()();} catch(e) {}
    try {method() >> [1, 2];} catch(e) {}

    //additive expressions
    try { 1 + 2 << 2;} catch(var e ) {}
    try { 0 - 0 >> null + null;} catch(var e ) {}
    try { [] + {} >> 0;} catch(var e ) {}

    //multiplicative expressions
    try {true * false << id.id / []();} catch(e) {}
    try {this[1] % null(1) >> topLevelFunction()[0]++ ~/ {}()[0];} catch(e) {}
    try {2 * 3 >> 0/0;} catch(e) {}

    //unary expressions
    try {-this >> ~this;} catch(e) {}
    try {--id << id++;} catch(e) {}
    try {~-id << !!false;} catch(e) {}
    try {++1[1] >> ()=>2[0]--;} catch(e) {}

    //function expression is a primary is an additive expr.
    try { ()=>0 >> 1; } catch(e) {}
    try { void f(var x) {} << 0.5; } catch(e) {}
    try { int f()=> 1 >> double g() {return 0.5;} } catch(e) {}
  }
  var _id;
}

main() {
  A a = new A();
  a.test();
}