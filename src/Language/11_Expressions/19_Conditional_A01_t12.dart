/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression evaluates one of two expressions
 * based on a boolean condition.
 * conditionalExpression:
 *   logicalOrExpression ('?' expressionWithoutCascade ':' expressionWithoutCascade)?
 * ;
 * @description Checks that a reference to a type alias declaration
 * can be used as the condition in a conditional expression.
 * @author msyabro
 * @reviewer kaigorodov
 */

typedef int fun();

main() {
  try {
    fun ? 1 : 2;
  } catch(e) {}
}
