/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Relational expressions invoke the relational operators on objects.
 * relationalExpression:
 *   bitwiseOrExpression (typeTest | typeCast | relationalOperator
 * bitwiseOrExpression)? |
 *   super relationalOperator bitwiseOrExpression
 * ;
 * relationalOperator:
 *   '>=' |
 *   '>' |
 *   '<=' |
 *   '<'
 * ;
 * A relational expression is either a bitwise expression, or an invocation of
 * a relational operator on either super or an expression e1, with argument e2.
 * @description Checks that various expressions fitted into this grammar
 * don't cause compile-time errors.
 * @Issue #36343
 * @author msyabro
 */
// SharedOptions=--enable-experiment=triple-shift

import '../../../Utils/expect.dart';

topLevelFunction() {}

class S {
  const S();
  operator >=(var v) {}
  operator >(var v) {}
  operator <=(var v) {}
  operator <(var v) {}
}

class A extends S {
  method() {}
  get id {}
  set id(var v) {}

  test() {
    //super
    super < 1;
    super > (super < true); // (...) is a primary expression, it's allowed by this production
    super <= (super > (super < []));
    super >= (super <= (super > (super < "")));

    // shift expression is an allowed type of argument for a relational expression
    try {super >= 1 << 2;} catch (e) {}

    // additive and multiplicative expressions are allowed arguments
    // for a shift expression
    try {super >= 1 + 1 >> 2 * 2;} catch (e) {}

    // additive and multiplicative expressions are allowed arguments
    // for a triple shift expression
    try {super >= 1 + 1 >>> 2 * 2;} catch (e) {}

    //literal is primary is postfix expr. is shift expr.
    try {this <= 0.25;} catch (e) {}

    //invocation is postfix expr. is shift expr.
    try {method() > topLevelFunction();} catch (e) {}
    try {1 < method()()();} catch (e) {}
    try {method() >= [1, 2];} catch (e) {}
    try {topLevelFunction() <= 1;} catch (e) {}

    //additive expression is a shift expr.
    Expect.isFalse(1 + 2 < 2);
    try { 0 - 0 > null + null;} catch (e) {}

    //multiplicative expression is a shift expr.
    try {2 * 3 >= 0 / 0;} catch (e) {}
    try {0 ~/ 1 >= 1 - -1;} catch (e) {}

    //unary expression is a shift expr.
    try {--id < id++;} catch (e) {}
    try {~-id >= !!false;} catch (e) {}

    //identifier
    try {id < id;} catch (e) {}
    try {id <= id;} catch (e) {}
    try {id > id;} catch (e) {}
    try {id >= id;} catch (e) {}

    //function expression is primary is postfix expr. is shift expr.
    // issue 1189
    try { () => 0 < 1; } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
