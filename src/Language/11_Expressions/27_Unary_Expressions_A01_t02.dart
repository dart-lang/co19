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
 *   unaryOperator super |
 *   '-' super |
 *   incrementOperator assignableExpression
 * ;
 * preﬁxOperator:
 *   ‘-’ |
 *   unaryOperator
 * ;
 * unaryOperator:
 *  ‘!’ |
 *  ‘˜’
 * ;
 * @description Checks that incrementOperator can be used with
 * a reference to a class declaration without a compile error.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class A {}

main() {
  try {
    --A;
    throw "Exception expected.";
  } catch(e) {}
}
