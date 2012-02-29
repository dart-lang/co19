/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Relational expressions invoke the relational operators on objects.
 * relationalExpression:
 *   shiftExpression (isOperator type | relationalOperator shiftExpression)? |
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
 * @needsreview 'shiftExpression isOperator type' should be a separate production in
 * the section 10_29, therefore isn't tested here. See issue 609.
 * @needsreview 'functionExpression' can be an operand by spec but is not allowed by implementation.
 * Issue 1189.
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
    super > (super < true);
    super <= (super > (super < []));
    super >= (super <= (super > (super < "")));

    //literals
    try {1 >= false;} catch(var e) {}
    try {"abc" < null;} catch(var e) {}
    try {[1, 2, 3] > {"key" : "value"};} catch(var e) {}
    try {this <= 0.25;} catch(var e) {}

    //function expressions
    try { ()=>0 < 1; } catch(var e) {}
    try { void f(var x) {} <= 0.5; } catch(var e) {}
    try { int f()=> 1 > double g() {return 0.5;} } catch(var e) {}
    try { (){} >= ()=>null;} catch(var e) {}

    //constants
    try {const [] > const {};} catch(var e) {}
    try {const ["1", 2] >= const S();} catch(var e) {}
    try {const [] < 1;} catch(var e) {}
    try {const {"a": 1, "b": 2} <= 1;} catch(var e) {}

    //invocations
    try {method() > topLevelFunction();} catch(var e) {}
    try {1 < method()()();} catch(var e) {}
    try {method() >= [1, 2];} catch(var e) {}
    try {topLevelFunction() <= 1;} catch(var e) {}

    //assignment and equality
    try {(1[1] = 2) < (1 === 2);} catch(var e) {}
    try {(id !== id) > (true == false);} catch(var e) {}
    try {(3(2(1)) != 1(2(3))) >= 0;} catch(var e) {}
    try {(id = _id) <= id;} catch(var e) {}

    //logical and relational expressions
    try {(1 < 2) < (true > false ? 1 : id);} catch(var e) {}
    try {(true >= false) > ([] && {});} catch(var e) {}
    try {(null || this) >= (id > 7);} catch(var e) {}
    try {(1 && 1) >= (2 || 2);} catch(var e) {}

    //bitwise and shift expressions
    try {(1[1] ^ 2(2)) < (new S() & true);} catch(var e) {}
    try {(id | method()) > null;} catch(var e) {}
    try {({}() >> []()) >= (){};} catch(var e) {}
    try {(1 << 2) <= (null >> null);} catch(var e) {}

    //additive expressions
    try { (1 + 2) < 2;} catch(var e ) {}
    try { (0 - 0) > (null + null);} catch(var e ) {}
    try { ([] + ({} <= (){})) >= 0;} catch(var e ) {}
    try { ("" - '') >= 0;} catch(var e ) {}

    //multiplicative expressions
    try {(true * false) < (id.id / []());} catch(var e) {}
    try {(this[1] % null(1)) > ((topLevelFunction()[0]++) ~/ {}()[0]);} catch(var e) {}
    try {(2 * 3) >= (0/0);} catch(var e) {}
    try {(0 ~/ 1) >= (1 - -1);} catch(var e) {}

    //unary expressions
    try {(-this) > (~this);} catch(var e) {}
    try {(--id) < (id++);} catch(var e) {}
    try {(~-id) >= (!!false);} catch(var e) {}
    try {(++1[1]) <= (()=>2[0]--);} catch(var e) {}

    //identifier
    try {id < id;} catch(var e) {}
    try {id <= id;} catch(var e) {}
    try {id > id;} catch(var e) {}
    try {id >= id;} catch(var e) {}
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
