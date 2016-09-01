/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   preﬁxOperator unaryExpression |
 *   awaitExpression |
 *   postﬁxExpression |
 *   (minusOperator | tildeOperator) super |
 *   incrementOperator assignableExpression
 * ;
 * preﬁxOperator:
 *   minusOperator |
 *   negationOperator |
 *   tildeOperator
 * ;
 * minusOperator:
 *   ‘-’ |
 * ;
 * negationOperator:
 *   ‘!’ |
 * ;
 * tildeOperator:
 *   ‘˜’
 * ;
 * A unary expression is either a postfix expression, an await expression or
 * an invocation of a prefix operator on an expression or an invocation of a
 * unary operator on either super or an expression e.
 * @description Checks that unary expressions of the form
 * [incrementOperator assignableExpression] don't cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class S {
  S() : x = 1;
  operator [](var ind) {return x;}
  operator []=(var ind, var val) {x = val;}
  var x;
}

class A  extends S{
  A() : id = 1;
  method() {}

  test() {
    //identifier
    ++id;
    --id;

    //invocation of getter or list access on super
    --super.x; // issue 1300
    ++super[0]; // issue 1300

    //invocation of a method, getter or list access operator on an expression e.

    //thisExpression
    --this[0];
    ++this.x;

    //functionExpression
    ++() {} [0]; /// 01: static type warning, runtime error
    --() {}.x; /// 02: static type warning, runtime error

    //nullLiteral
    --null["key"]; /// 03: runtime error
    ++null.x; /// 04: runtime error

    //booleanLiteral
    ++true[1]; /// 05: static type warning, runtime error
    --true.t; /// 06: static type warning, runtime error

    //numericLiteral
    --1[1]; /// 07: static type warning, runtime error
    ++1.num; /// 08: static type warning, runtime error

    //stringLiteral
    ++"s"["s"]; /// 09: static type warning, runtime error
    --"".c; /// 10: static type warning, runtime error

    //mapLiteral
    ++{"1" : 1, "2" : 2}["1"];
    --{"1" : 1, "2" : 2}.prop; /// 11: static type warning, runtime error

    //listLiteral
    ++[0, 1, 2, 3][1];
    --[].a; /// 12: static type warning, runtime error

    //identifier
    ++id["id"]; /// 13: runtime error
    --id.id; /// 14: runtime error

    //newExpression
    --new A()[0];
    ++new A().x;

    //constantObjectExpression
    --const [1, 2, 3][0]; /// 15: runtime error
    ++const {"1":1}.x; /// 16: static type warning, runtime error

    //functionInvocation
    ++topLevelFunction()[0]; /// 17: static type warning, runtime error
    --topLevelFunction().x; /// 18: static type warning, runtime error

    //methodInvocation
    ++this.method()[1]; /// 19: runtime error
    --this.method().x; /// 20: runtime error

    //(...)
    ++(id = 2)[0]; /// 21: static type warning, runtime error
    --(id += 1).x; /// 22: runtime error
    --(super.x)[0]; /// 23: runtime error
    ++(true ? 1 : 2)[1]; /// 24: static type warning, runtime error
    --(true || false)[0]; /// 25: static type warning, runtime error
    ++(id & 1)[0]; /// 26: runtime error
    ++(1 == 1)[0]; /// 27: static type warning, runtime error
    --(2 <= 3).x; /// 28: static type warning, runtime error
    ++(1 << 1)[0]; /// 29: static type warning, runtime error
    ++(0 + 0)[0]; /// 30: static type warning, runtime error
    --(1 * 5)[4]; /// 31: static type warning, runtime error
    ++(id++)[0]; /// 32: runtime error
    ++(1 is int)[0]; /// 33: static type warning, runtime error

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}
