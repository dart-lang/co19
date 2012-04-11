/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   prefixOperator unaryExpression |
 *   postfixExpression |
 *   unaryOperator super |
 *   '-' super |
 *   incrementOperator assignableExpression
 * ;
 * prefixOperator:
 *   '-' |
 *   negateOperator
 * ;
 * negateOperator:
 *   '!' |
 *   '~'
 * ;
 * @description Checks that expressions of the form [incrementOperator assignableExpressions]
 * don't cause compile-time errors.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @note issue #1300
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
    ++id;
    --id;

    //super
    --super.x;
    ++super[0];

    //thisExpression
    try { --this[0]; } catch(var e) {}
    try { ++this.x;  } catch(var e) {}

    //functionExpression
    try { ++void f() {} [0]; } catch(var e) {}
    try { --(){}.x; } catch(var e) {}

    //nullLiteral
    try { --null["key"]; } catch(var e) {}
    try { ++null.x; } catch(var e) {}

    //booleanLiteral
    try {++true[1];} catch(var e) {}
    try {--true.t;} catch(var e) {}

    //numericLiteral
    try {--1[1];} catch(var e) {}
    try {++1.num;} catch(var e) {}

    //stringLiteral
    try {++"s"["s"];} catch(var e) {}
    try {--"".c;} catch(var e) {}

    //mapLiteral
    try { ++{"1" : 1, "2" : 2}["1"]; } catch(var e) {}
    try { --{"1" : 1, "2" : 2}.prop; } catch(var e) {}

    //listLiteral
    try { ++[0, 1, 2, 3][1]; } catch(var e) {}
    try { --[].a; } catch(var e) {}

    //identifier
    try { ++id["id"];} catch(var e) {}
    try { --id.id;} catch(var e) {}

    //newExpression
    try { --new A()[0];} catch(var e) {}
    try { ++new A().x;} catch(var e) {}

    //constantObjectExpression
    try { --const [1, 2, 3][0];} catch(var e) {}
    try { ++const {"1":1}.x;} catch(var e) {}

    //(functionInvocation)
    try { ++(topLevelFunction())[0];} catch(var e) {}
    try { --(topLevelFunction()).x;} catch(var e) {}

    //(methodInvocation)
    try { ++(this.method())[1]; } catch(var e) {}
    try { --(this.method()).x; } catch(var e) {}

    //(assignmentExpression)
    try { ++(id = 2)[0];} catch(var e) {}
    try { --(id += 1).x;} catch(var e) {}

    //(conditionalExpression)
    try { ++(true ? 1 : 2)[1];} catch(var e) {}
    try { --(false ? "a" : "b").x;} catch(var e) {}

    //(logicalBooleanExpression)
    try { --(true || false)[0];} catch(var e) {}
    try { ++(false && true).x; } catch(var e) {}

    //(bitwiseExpression)
    try { ++(id & 1)[0];} catch(var e) {}
    try { --(id ^ 1).x;} catch(var e) {}

    //(equalityExpression)
    try { ++(1 == 1)[0];} catch(var e) {}
    try { --(1 === 1).x;} catch(var e) {}

    //(relationalExpression)
    try { ++(1 < 1)["a"];} catch(var e) {}
    try { --(2 <= 3).x;} catch(var e) {}

    //(shiftExpression)
    try { ++(1 << 1)[0];} catch(var e) {}
    try { --(1 >> 1).x;} catch(var e) {}

    //(additiveExpression)
    try { ++(0 + 0)[0];} catch(var e) {}
    try { --(2 - 10).prop;} catch(var e) {}

    //(multiplicativeExpression)
    try { --(1 * 5)[4];} catch(var e) {}
    try { ++(0 / 2).res;} catch(var e) {}

    //(unaryExpression)
    try { ++(id++)[0];} catch(var e) {}
    try { --(id--).x;} catch(var e) {}

    //(isExpression)
    try { ++(1 is int)[0];} catch(var e) {}
    try { --(1 is ! bool).id;} catch(var e) {}

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}
