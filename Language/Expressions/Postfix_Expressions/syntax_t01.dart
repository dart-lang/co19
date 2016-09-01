/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Postfix expressions invoke the postfix operators on objects.
 * postfixExpression:
 *   assignableExpression postfixOperator |
 *   primary (selector* | (‘#’ ( (identifier ‘=’?) | operator)))
 * ;
 * postfixOperator:
 *   incrementOperator
 * ;
 * selector:
 *   assignableSelector |
 *   arguments
 * ;
 * incrementOperator:
 *   '++' |
 *   '--'
 * ;
 * A postfix expression is either a primary expression, a function, method or
 * getter invocation, or an invocation of a postfix operator on an expression e.
 * @description Checks that any assignableExpression can be used with
 * postfixOperator.
 * See tests 10_27_Assignable_Expressions_A01_t0[1-3].dart
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 * @needsreview issue 2709
 */

class S {
  S() : x = 1;
  operator [](var ind) {return x;}
  operator []=(var ind, var val) {x = val;}
  var x;
}

class C {
  const C();
  const C.c2();
}

class A  extends S {
  A() : id = 1;
  method() {}
  var id;

  test() {
    //identifier
    id++;
    id--;

    //super
    super[0];
    super.x;
    super[0]++; // issue 1300
    super.x--; // issue 1300

    //thisExpression
    this[0];
    this.x;
    this[0]--;
    this.x++;

    //functionExpression
    () {} [0];  /// 01: static type warning, runtime error
    () {}.x;  /// 02: static type warning, runtime error
    () {} [0]++; /// 03: static type warning, runtime error
    () {}.x--; /// 04: static type warning, runtime error
    () {}.x; /// 05: static type warning, runtime error
    () {}.x--; /// 06: static type warning, runtime error

    //nullLiteral
    null["key"]; /// 07: runtime error
    null.x; /// 08: runtime error
    null["key"]--; /// 09: runtime error
    null.x++; /// 10: runtime error

    //booleanLiteral
    true[1]; /// 11: static type warning, runtime error
    true.t; /// 12: static type warning, runtime error
    true[1]++; /// 13: static type warning, runtime error
    true.t--; /// 14: static type warning, runtime error

    //numericLiteral
    1[1]; /// 15: static type warning, runtime error
    1.num; /// 16: static type warning, runtime error
    1[1]--; /// 17: static type warning, runtime error
    1.num++; /// 18: static type warning, runtime error

    //stringLiteral
    "s"["s"]; /// 19: static type warning, runtime error
    "".c; /// 20: static type warning, runtime error
    "s"["s"]++; /// 21: static type warning, runtime error
    "".c--; /// 22: static type warning, runtime error

    //mapLiteral
    true ? {"1" : 1, "2" : 2}["1"]++ : null; 
    true ? {"1" : 1, "2" : 2}.prop-- : null; /// 23: static type warning, runtime error
    const {"1":1}.x; /// 24: static type warning, runtime error
    const {"1":1}.x++; /// 25: static type warning, runtime error

    //listLiteral
    [0, 1, 2, 3][1];
    [].a; /// 26: static type warning, runtime error
    [0, 1, 2, 3][1]++;
    [].a--; /// 27: static type warning, runtime error
    const [1, 2, 3][0];
    const [1, 2, 3][0]--; /// 29: runtime error

    //identifier
    id["id"]; /// 30: runtime error
    id.id; /// 31: runtime error
    id["id"]++; /// 32: runtime error
    id.id--; /// 33: runtime error

    //newExpression
    new A()[0];
    new A().x;
    new A()[0]--;
    new A().x++;

    //constObjectExpression
    const C()[0]++; /// 34: static type warning, runtime error
    const C().v++; /// 35: static type warning, runtime error
    const C.c2()[0]++; /// 36: static type warning, runtime error
    const C.c2().v++; /// 37: static type warning, runtime error

    //(...) is a primary
    (topLevelFunction())[0]; /// 38: static type warning, runtime error
    // (...)[...] or (...).v is an assignable expression
    (topLevelFunction())[0]++; /// 39: static type warning, runtime error
    (topLevelFunction()).x--; /// 40: static type warning, runtime error
  }
}

main() {
  A a = new A();
  a.test();
}
