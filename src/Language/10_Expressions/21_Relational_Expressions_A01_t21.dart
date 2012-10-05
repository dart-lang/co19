/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Relational expressions invoke the relational operators on objects.
 * relationalExpression:
 *   shiftExpression (typeTest | typeCast | relationalOperator shiftExpression)? |
 *   super relationalOperator shiftExpression
 * ;
 * relationalOperator:
 *   '>=' |
 *   '>' |
 *   '<=' |
 *   '<'
 * ;
 * A relational expression is either a shift expression, or an invocation
 * of a relational operator on either super or an expression e1, with argument e2.
 * @description Checks that a reference to an interface declaration can be used
 * as the second operand in a relational expression.
 * @author kaigorodov
 */

typedef void proc();

main() {
  try {
    1 >= proc;
  } catch(e) {}
}
