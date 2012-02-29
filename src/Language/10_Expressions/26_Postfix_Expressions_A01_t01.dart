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
 * @needsreview Issue 655, 1189
 */

class S {
  S() : x = 1;
  operator[](var ind) {return x;}
  operator[]=(var ind, var val) {x = val;}
  var x;
}

class A  extends S{
  A() : id = 1;
  method() {}

  test() {
    //identifier
    id++;
    id--;

    //super
//    super[0]++;
    super[0];
//    super.x--;
    super.x;

    //thisExpression
    try { this[0]--; } catch(var e) {}
    try { this.x++;  } catch(var e) {}

    //functionExpression
//    try { void f() {} [0]++; } catch(var e) {}
    try { void f() {} [0]; } catch(var e) {}
    try { (){}.x--; } catch(var e) {}

    //nullLiteral
    try { null["key"]--; } catch(var e) {}
    try { null.x++; } catch(var e) {}

    //booleanLiteral
    try {true[1]++;} catch(var e) {}
    try {true.t--;} catch(var e) {}

    //numericLiteral
    try {1[1]--;} catch(var e) {}
    try {1.num++;} catch(var e) {}

    //stringLiteral
    try { "s"["s"]++;} catch(var e) {}
    try {"".c--;} catch(var e) {}

    //mapLiteral
    try { {"1" : 1, "2" : 2}["1"]++; } catch(var e) {}
    try { {"1" : 1, "2" : 2}.prop--; } catch(var e) {}

    //listLiteral
    try { [0, 1, 2, 3][1]++; } catch(var e) {}
    try { [].a--; } catch(var e) {}

    //identifier
    try { id["id"]++;} catch(var e) {}
    try { id.id--;} catch(var e) {}

    //newExpression
    try { new A()[0]--;} catch(var e) {}
    try { new A().x++;} catch(var e) {}

    //constantObjectExpression
    try { const [1, 2, 3][0]--;} catch(var e) {}
    try { const {"1":1}.x++;} catch(var e) {}

    //(functionInvocation)
    try { (topLevelFunction())[0]++;} catch(var e) {}
    try { (topLevelFunction()).x--;} catch(var e) {}

    //(methodInvocation)
    try { (this.method())[1]++; } catch(var e) {}
    try { (this.method()).x--; } catch(var e) {}

    //(assignmentExpression)
    try { (id = 2)[0]++;} catch(var e) {}
    try { (id += 1).x--;} catch(var e) {}

    //(conditionalExpression)
    try { (true ? 1 : 2)[1]++;} catch(var e) {}
    try { (false ? "a" : "b").x--;} catch(var e) {}

    //(logicalBooleanExpression)
    try { (true || false)[0]--;} catch(var e) {}
    try { (false && true).x++; } catch(var e) {}

    //(bitwiseExpression)
    try { (id & 1)[0]++;} catch(var e) {}
    try { (id ^ 1).x--;} catch(var e) {}

    //(equalityExpression)
    try { (1 == 1)[0]++;} catch(var e) {}
    try { (1 === 1).x--;} catch(var e) {}

    //(relationalExpression)
    try { (1 < 1)["a"]++;} catch(var e) {}
    try { (2 <= 3).x--;} catch(var e) {}

    //(shiftExpression)
    try { (1 << 1)[0]++;} catch(var e) {}
    try { (1 >> 1).x--;} catch(var e) {}

    //(additiveExpression)
    try { (0 + 0)[0]++;} catch(var e) {}
    try { (2 - 10).prop--;} catch(var e) {}

    //(multiplicativeExpression)
    try { (1 * 5)[4]--;} catch(var e) {}
    try { (0 / 2).res++;} catch(var e) {}

    //(unaryExpression)
    try { (id++)[0]++;} catch(var e) {}
    try { (id--).x--;} catch(var e) {}

    //(isExpression)
    try { (1 is int)[0]++;} catch(var e) {}
    try { (1 is ! bool).id--;} catch(var e) {}

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}