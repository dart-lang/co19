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
 * @description Checks that a type parameter can be used
 * as left operand in an additive expression without a compile error.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class A <T> {
  test() {
    T - 1; /// 01: static type warning, runtime error
  }
}

main() {
  A a = new A();
  a.test();
}
