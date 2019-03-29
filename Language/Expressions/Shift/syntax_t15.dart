/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that it is permitted to chain as many shift expressions
 * as one likes.
 * @author rodionov
 */
// SharedOptions=--enable-experiment=triple-shift

class A {
  operator <<(other) => other;
  operator >>(other) => other;
  operator >>>(other) => other;
}

class B extends A {
  void test() {
    super >> 1 << 1 << -1000 << 100 >> 124 >>> 1123 << 10 >>> 111;
  }
}

main() {
  try {
    1 >> 1 << 1 >>> -12 << -1000 << 100 >> 124 >>> 3;
    new B().test();
  } catch (e) {}
}
