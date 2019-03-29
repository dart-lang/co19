/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Shift expressions invoke the shift operators on objects.
 * shiftExpression:
 *   additiveExpression (shiftOperator additiveExpression)* |
 *   super (shiftOperator additiveExpression)+
 * ;
 * shiftOperator:
 *   '<<' |
 *   '>>' |
 *   '>>>'
 * ;
 * A shift expression is either an additive expression, or an invocation
 * of a shift operator on either super or an expression e1, with argument e2.
 * @description Checks that [super] can be used only as the first operand in
 * a shift expression.
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

class S {}

class A extends S {
  test() {
    try {
      1 >>> super;
    } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
