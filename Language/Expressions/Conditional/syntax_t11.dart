/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression evaluates one of two expressions
 * based on a boolean condition.
 * conditionalExpression:
 *   ifNullExpression ('?' expressionWithoutCascade ':'
 * expressionWithoutCascade)?
 * ;
 * @description Checks that a reference to a class declaration can be used
 * as one of expressions in a conditional expression without a compile error.
 * @author msyabro
 * @reviewer kaigorodov
 */

class A {}

main() {
  try {
    true ? 1 : A;
  } catch (e) {}
}
