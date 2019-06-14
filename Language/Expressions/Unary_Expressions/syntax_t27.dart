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
    ~x--;

    //combination of prefix and increment operator
    try {- --x;} catch (e) {}
    try {~--x;} catch (e) {}
    try {-++x;} catch (e) {}
    try {~++x;} catch (e) {}

    //prefixOperator postfixExpression>primary>identifier
    -x;
    ~x;
    ~~x;

    //prefix operators with literals
    try {-1;} catch (e) {}
    try {~2;} catch (e) {}

    try {-this;} catch (e) {}

    !!false;
    !!!true;
    !!!!false;
    !!!!!!true;

    //prefix operators with various expressions
    try {~(1 + 2);} catch (e) {}

    // super with selector
    try {-super[0];} catch (ok) {}
    try {~super.x;} catch (ok) {}
    try {!super[0];} catch (ok) {}
  }
}

main() {
  A a = new A();
  a.test();
}
