/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   preï¬�xOperator unaryExpression |
 *   awaitExpression |
 *   postï¬�xExpression |
 *   (minusOperator | tildeOperator) super |
 *   incrementOperator assignableExpression
 * ;
 * preï¬�xOperator:
 *   minusOperator |
 *   negationOperator |
 *   tildeOperator
 * ;
 * minusOperator:
 *   â€˜-â€™ |
 * ;
 * negationOperator:
 *   â€˜!â€™ |
 * ;
 * tildeOperator:
 *   â€˜Ëœâ€™
 * ;
 * A unary expression is either a postfix expression, an await expression or
 * an invocation of a prefix operator on an expression or an invocation of a
 * unary operator on either super or an expression e.
 * @description Checks that incrementOperator can't be used with
 * postfixExpression
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

main() {
  var x = 1;
  ++x--;
}
