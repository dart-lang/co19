/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   prefixOperator unaryExpression |
 *   postfixExpression |
 *   prefixOperator super |
 *   incrementOperator assignableExpression
 * ;
 * prefixOperator:
 *   ‘-’ |
 *   unaryOperator
 * ;
 * unaryOperator:
 *  ‘!’ |
 *  ‘˜’
 * ;
 * @description Checks that incrementOperator can't be used with postfixExpression
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

main() {
  var x = 1;
  try {
    ++x--;
  } catch(e) {}
}
