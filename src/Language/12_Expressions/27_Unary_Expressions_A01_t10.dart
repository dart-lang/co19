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
 *   prefixOperator super |
 *   incrementOperator assignableExpression
 * ;
 * prefixOperator:
 *   '-' |
 *   unaryOperator
 * ;
 * unaryOperator:
 *   '!' |
 *   '~'
 * ;
 * @description Checks that unary expressions of the form [incrementOperator assignableExpression]
 * don't cause compile-time errors.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
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

    //invocation of getter or list access on super
    --super.x; // issue 1300
    ++super[0]; // issue 1300

    //invocation of a method, getter or list access operator on an expression e.
    
    //thisExpression
    try { --this[0]; } catch(e) {}
    try { ++this.x;  } catch(e) {}

    //functionExpression
    try { ++() {} [0]; } catch(e) {} /// static type warnings galore
    try { --(){}.x; } catch(e) {}

    //nullLiteral
    try { --null["key"]; } catch(e) {}
    try { ++null.x; } catch(e) {}

    //booleanLiteral
    try {++true[1];} catch(e) {}
    try {--true.t;} catch(e) {}

    //numericLiteral
    try {--1[1];} catch(e) {}
    try {++1.num;} catch(e) {}

    //stringLiteral
    try {++"s"["s"];} catch(e) {}
    try {--"".c;} catch(e) {}

    //mapLiteral
    try { ++{"1" : 1, "2" : 2}["1"]; } catch(e) {}
    try { --{"1" : 1, "2" : 2}.prop; } catch(e) {}

    //listLiteral
    try { ++[0, 1, 2, 3][1]; } catch(e) {}
    try { --[].a; } catch(e) {}

    //identifier
    try { ++id["id"];} catch(e) {}
    try { --id.id;} catch(e) {}

    //newExpression
    try { --new A()[0];} catch(e) {}
    try { ++new A().x;} catch(e) {}

    //constantObjectExpression
    try { --const [1, 2, 3][0];} catch(e) {}
    try { ++const {"1":1}.x;} catch(e) {}

    //functionInvocation
    try { ++topLevelFunction()[0];} catch(e) {}
    try { --topLevelFunction().x;} catch(e) {}

    //methodInvocation
    try { ++this.method()[1]; } catch(e) {}
    try { --this.method().x; } catch(e) {}

    //(...)
    try { ++(id = 2)[0];} catch(e) {}
    try { --(id += 1).x;} catch(e) {}
    try { --(super.x)[0];} catch(e) {}
    try { ++(true ? 1 : 2)[1];} catch(e) {}
    try { --(true || false)[0];} catch(e) {}
    try { ++(id & 1)[0];} catch(e) {}
    try { ++(1 == 1)[0];} catch(e) {}
    try { --(2 <= 3).x;} catch(e) {}
    try { ++(1 << 1)[0];} catch(e) {}
    try { ++(0 + 0)[0];} catch(e) {}
    try { --(1 * 5)[4];} catch(e) {}
    try { ++(id++)[0];} catch(e) {}
    try { ++(1 is int)[0];} catch(e) {}

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}
