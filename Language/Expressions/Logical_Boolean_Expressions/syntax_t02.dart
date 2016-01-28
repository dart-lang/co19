/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The logical boolean expressions combine boolean objects using
 * the boolean conjunction and disjunction operators.
 * logicalOrExpression:
 *   logicalAndExpression ('||' logicalAndExpression)*
 * ;
 * logicalAndExpression:
 *   equalityExpression ('&&' equalityExpression)*
 * ;
 * A logical boolean expression is either an equality expression, or an
 * invocation of a logical boolean operator on an expression e1 with argument
 * e2.
 * @description Checks that super can't be used as the first operand of a
 * logical boolean expression.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {}

class A extends S {
  test() {
    try {
      super && true;
    } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
