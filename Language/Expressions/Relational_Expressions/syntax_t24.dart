/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Relational expressions invoke the relational operators on objects.
 * relationalExpression:
 *   bitwiseOrExpression (typeTest | typeCast | relationalOperator
 * bitwiseOrExpression)? |
 *   super relationalOperator bitwiseOrExpression
 * ;
 * relationalOperator:
 *   '>=' |
 *   '>' |
 *   '<=' |
 *   '<'
 * ;
 * A relational expression is either a bitwise expression, or an invocation of
 * a relational operator on either super or an expression e1, with argument e2.
 * @description Checks that super can't be used as the second operand in a
 * relational expression without a compile error.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {}

class A extends S {
  test() {
    try {
      1 >= super;
    } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
