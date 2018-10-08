/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Bitwise expressions invoke the bitwise operators on objects.
 * bitwiseOrExpression:
 *   bitwiseXorExpression ('|' bitwiseXorExpression)* |
 *   super ('|' bitwiseXorExpression)+
 * ;
 * bitwiseXorExpression:
 *   bitwiseAndExpression ('^' bitwiseAndExpression)* |
 *   super ('^' bitwiseAndExpression)+
 * ;
 * bitwiseAndExpression:
 *   shiftExpression ('&' shiftExpression)* |
 *   super ('&' shiftExpression)+
 * ;
 * bitwiseOperator:
 * '&' |
 * '^' |
 * '|'
 * ;
 * A bitwise expression is either an shift expression, or an invocation of a
 * bitwise operator on either super or an expression e1, with argument e2.
 * @description Checks that a type variable cannot be used as the second operand
 * of a bitwise expression without a compile error.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class A<T> {
  test() {
    1 | T;
  }
}

main() {
  A<String> a = new A<String>();
  a.test();
}

