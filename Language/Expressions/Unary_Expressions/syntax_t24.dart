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
 * @description Checks that it's a compile-time error when a '~'
 * precedes a statement that isn't an expression (return statement).
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

main() {
  try {
    ~return 0;
  } catch (e) {}
}
