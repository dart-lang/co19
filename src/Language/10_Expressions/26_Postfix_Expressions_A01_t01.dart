/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Postfix expressions invoke the postfix operators on objects.
 * postfixExpression:
 *   assignableExpression postfixOperator |
 *   primary selector*
 * ;
 * postfixOperator:
 *   incrementOperator
 * ;
 * incrementOperator:
 *   '++' |
 *   '--'
 * ;
 * A postfix expression is either a primary expression, a function, method or
 * getter invocation, or an invocation of a postfix operator on an expression e.
 * @description Checks that any assignableExpression can be used with postfixOperator.
 * See tests 10_27_Assignable_Expressions_A01_t0[1-3].dart
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 * @needsreview Issues 1189, 1300, 1994, 2709 and 91 @ co19
 */

class S {
  S() : x = 1;
  operator[](var ind) {return x;}
  operator[]=(var ind, var val) {x = val;}
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
    try { this[0];} catch(var e) {}
    try { this.x;} catch(var e) {}
    try { this[0]--;} catch(var e) {}
    try { this.x++;} catch(var e) {}

    //functionExpression
    try { void f() {} [0]; } catch(var e) {}
    try { void f() {}.x; } catch(var e) {} // issue 2709
    try { void f() {} [0]++; } catch(var e) {} // issue 2709
    try { void f() {}.x--; } catch(var e) {} // issue 2709
    try { (){}.x; } catch(var e) {}
    try { (){}.x--; } catch(var e) {}

    //nullLiteral
    try { null["key"]; } catch(var e) {}
    try { null.x; } catch(var e) {}
    try { null["key"]--; } catch(var e) {}
    try { null.x++; } catch(var e) {}

    //booleanLiteral
    try {true[1];} catch(var e) {}
    try {true.t;} catch(var e) {}
    try {true[1]++;} catch(var e) {}
    try {true.t--;} catch(var e) {}

    //numericLiteral
    try {1[1];} catch(var e) {}
    try {1.num;} catch(var e) {}
    try {1[1]--;} catch(var e) {}
    try {1.num++;} catch(var e) {}

    //stringLiteral
    try { "s"["s"];} catch(var e) {}
    try {"".c;} catch(var e) {}
    try { "s"["s"]++;} catch(var e) {}
    try {"".c--;} catch(var e) {}

    //mapLiteral
    // see issues 91 @ co19 and 1994
//    try { {"1" : 1, "2" : 2}["1"]++; } catch(var e) {}
//    try { {"1" : 1, "2" : 2}.prop--; } catch(var e) {}
    try { const {"1":1}.x;} catch(var e) {}
    try { const {"1":1}.x++;} catch(var e) {}

    //listLiteral
    try { [0, 1, 2, 3][1]; } catch(var e) {}
    try { [].a; } catch(var e) {}
    try { [0, 1, 2, 3][1]++; } catch(var e) {}
    try { [].a--; } catch(var e) {}
    try { const [1, 2, 3][0];} catch(var e) {}
    try { const [1, 2, 3][0]--;} catch(var e) {}

    //identifier
    try { id["id"];} catch(var e) {}
    try { id.id;} catch(var e) {}
    try { id["id"]++;} catch(var e) {}
    try { id.id--;} catch(var e) {}

    //newExpression
    try { new A()[0];} catch(var e) {}
    try { new A().x;} catch(var e) {}
    try { new A()[0]--;} catch(var e) {}
    try { new A().x++;} catch(var e) {}

    //constObjectExpression
    try { const C()[0]++;} catch(var e) {}
    try { const C().v++;} catch(var e) {}
    try { const C.c2()[0]++;} catch(var e) {}
    try { const C.c2().v++;} catch(var e) {}

    //(...) is a primary
    try { (topLevelFunction())[0];} catch(var e) {}
    // (...)[...] or (...).v is an assignable expression
    try { (topLevelFunction())[0]++;} catch(var e) {}
    try { (topLevelFunction()).x--;} catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
