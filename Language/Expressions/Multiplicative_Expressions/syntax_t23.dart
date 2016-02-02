/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Multiplicative expressions invoke the multiplication operators on
 * objects.
 * multiplicativeExpression:
 *   unaryExpression (multiplicativeOperator unaryExpression)* |
 *   super (multiplicativeOperator unaryExpression)+
 * ;
 * multiplicativeOperator:
 *   '*' |
 *   '/' |
 *   '%' |
 *   '~/'
 * ;
 * A multiplicative expression is either a unary expression, or an invocation
 * of a multiplicative operator on either super or an expression e1, with
 * argument e2.
 * @description Checks that two multiplicative operators / can't be placed
 * one after another in a multiplicative expression.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

main() {
  try {
    0 / / 0;
  } catch (e) {}
}
