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
 * @description Checks that super can't be used in a conditional expression
 * as the first expression.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {}

class A extends S {
  test() {
    try {
      true ? super : 2;
    } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
