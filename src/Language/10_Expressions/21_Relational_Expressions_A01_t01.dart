/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Relational expressions invoke the relational operators on objects.
 * relationalExpression:
 *   shiftExpression (typeTest | typeCast | relationalOperator shiftExpression)? |
 *   super relationalOperator shiftExpression
 * ;
 * relationalOperator:
 *   '>=' |
 *   '>' |
 *   '<=' |
 *   '<'
 * ;
 * A relational expression is either a shift expression, or an invocation
 * of a relational operator on either super or an expression e1, with argument e2.
 * @description Checks that various expressions fitted into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

topLevelFunction() {}

class S {
  const S();
  operator>=(var v) {}
  operator>(var v) {}
  operator<=(var v) {}
  operator<(var v) {}
}

class A extends S {
  method() {}
  get id() {}
  set id(var v) {}

  test() {
    //super
    super < 1;
    super > (super < true); // (...) is a primary expression, it's allowed by this production
    super <= (super > (super < []));
    super >= (super <= (super > (super < "")));
    
    // shift expression is an allowed type of argument for a relational expression
    try {super >= 1 << 2;} catch(var e) {}
    
    // additive and multiplicative expressions are allowed arguments
    // for a shift expression
    try {super >= 1 + 1 >> 2 * 2;} catch(var e) {}   

    //literal is primary is postfix expr. is shift expr.
    try {1 >= false;} catch(var e) {}
    try {"abc" < null;} catch(var e) {}
    try {[1, 2, 3] > {"key" : "value"};} catch(var e) {}
    try {this <= 0.25;} catch(var e) {}

    //constant literal is primary is postfix expr. is shift expr.
    try {const [] > const {};} catch(var e) {}
    try {const ["1", 2] >= const S();} catch(var e) {}
    try {const [] < 1;} catch(var e) {}
    try {const {"a": 1, "b": 2} <= 1;} catch(var e) {}

    //invocation is postfix expr. is shift expr.
    try {method() > topLevelFunction();} catch(var e) {}
    try {1 < method()()();} catch(var e) {}
    try {method() >= [1, 2];} catch(var e) {}
    try {topLevelFunction() <= 1;} catch(var e) {}

    //additive expression is a shift expr.
    Expect.isFalse(1 + 2 < 2);
    try { 0 - 0 > null + null;} catch(var e ) {}
    try { [] + {} <= (){} - () => null;} catch(var e ) {}
    try { "" - '' >= 0;} catch(var e ) {}

    //multiplicative expression is a shift expr.
    try {true * false < id.id / []();} catch(var e) {}
    try {this[1] % null(1) > topLevelFunction()[0]++ ~/ {}()[0];} catch(var e) {}
    try {2 * 3 >= 0 / 0;} catch(var e) {}
    try {0 ~/ 1 >= 1 - -1;} catch(var e) {}

    //unary expression is a shift expr.
    try {-this > ~this;} catch(var e) {}
    try {--id < id++;} catch(var e) {}
    try {~-id >= !!false;} catch(var e) {}
    try {++1[1] <= ()=>2[0]--;} catch(var e) {}

    //identifier
    try {id < id;} catch(var e) {}
    try {id <= id;} catch(var e) {}
    try {id > id;} catch(var e) {}
    try {id >= id;} catch(var e) {}

    //function expression is primary is postfix expr. is shift expr.
    // issue 1189
    try { ()=>0 < 1; } catch(var e) {}
    try { void f(var x) {} <= 0.5; } catch(var e) {}
    try { int f()=> 1 > double g() {return 0.5;} } catch(var e) {}
    try { (){} >= ()=>null;} catch(var e) {}
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
