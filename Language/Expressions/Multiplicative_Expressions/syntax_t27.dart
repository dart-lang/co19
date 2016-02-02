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
 * @description Checks that using an assignment expression as the first operand
 * of a multiplicative expression results in the latter being an operand of the
 * former.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';


main() {
  var foo, bar;
  bar = (foo = 1 * 2);
  Expect.equals(2, foo);
  Expect.equals(2, bar);
}
