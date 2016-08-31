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
 * @description Checks that expressions with a prefix operator which fit into
 * this production don't cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class S {
  var x = 1;
  operator -() {return -x;}
  operator [](var ind) {return x;}
  operator []=(var ind, var val) {x = val;}
}

class A extends S {
  test() {
    //prefixOperator postfixExpression
    -x--;
    !x++; /// 01: dynamic type error
    ~x--;

    //combination of prefix and increment operator
    - --x;
    !--x; /// 02: dynamic type error
    ~--x;
    -++x;
    ~++x;

    //prefixOperator postfixExpression>primary>identifier
    -x;
    ~x;
    ~~x;
    !x; /// 03: dynamic type error
    !~x; /// 04: dynamic type error
    ~!x; /// 05: static type warning, runtime error

    //prefix operators with literals
    -1;
    ~2;
    !3; /// 06: static type warning, dynamic type error

    -null; /// 07: runtime error
    ~null; /// 08: runtime error
    !null; /// 09: dynamic type error

    -this;
    ~this; /// 10: static type warning, runtime error
    !this; /// 11: static type warning, dynamic type error

    -true; /// 12: static type warning, runtime error
    !!false;
    !!!true;
    !!!!false;
    !!!!!!true;
    ~true; /// 13: static type warning, runtime error

    -[]; /// 14: static type warning, runtime error
    ~{"1": 1}; /// 15: static type warning, runtime error
    !const [1]; /// 16: static type warning, dynamic type error

    -"s"; /// 17: static type warning, runtime error
    ~"t"; /// 18: static type warning, runtime error
    !"r"; /// 19: static type warning, dynamic type error

    //prefix operators with various expressions
    -(){}[0]; /// 20: static type warning, runtime error
    ! new S(); /// 21: static type warning, dynamic type error
    ~(1 + 2);

    // super with selector
    -super[0];
    ~super.x;
    !super[0]; /// 22: dynamic type error
  }
}

main() {
  A a = new A();
  a.test();
}
