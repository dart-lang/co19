/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Additive expressions invoke the addition operators on objects.
 * additiveExpression:
 *   multiplicativeExpression (additiveOperator multiplicativeExpression)* |
 *   super (additiveOperator multiplicativeExpression)+
 * ;
 * additiveOperator:
 *   '+' |
 *   '-'
 * ;
 * An additive expression is either a multiplicative expression, or an
 * invocation of an additive operator on either super or an expression e1, with
 * argument e2.
 * @description Checks that using an assignment expression as the first operand
 * of an additive expression results in the latter being an operand of the
 * former.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';


main() {
  var foo, bar;
  bar = (foo = 1 + 2);
  Expect.equals(3, foo);
  Expect.equals(3, bar);
}
