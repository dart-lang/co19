/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression evaluates one of two expressions
 * based on a boolean condition.
 * conditionalExpression:
 *   logicalOrExpression ('?' expression ':' expression)?
 * ;
 * @description Checks that a type variable
 * can't be used as one of expressions in a conditional expression.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview Issue 1225
 */

interface I {}

class A<T> {
  test() {
    try {
      true ? T : '';
    } catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}