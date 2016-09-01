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
 * @description Checks that various expressions fitted into this grammar don't
 * cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

topLevelFunction() {}

class S {
  const S();
  operator +(var x) {}
  operator -(var x) {}
  operator [](var idx) {}
  final foo = 1;
}

class A extends S {
  method() {}
  get id {}
  set id(var v) {}

  test() {
    //super is a primary
    super + 0;
    super - super[0];
    super + super.foo - [0][1][2][3]; /// 01: runtime error

    // chaining
     super + 0 - 1 + {} - null; /// 02: runtime error
    0 - 1 + {} - null; /// 03: static type warning, runtime error

    // (...)
    (this) + (1 ^ 0 & 4) - (1 <= 0); /// 04: runtime error

    //literals with selectors
    null + 5(); /// 05: static type warning, runtime error
    true[0] + "x".x - [[[0]]].y; /// 06: static type warning, runtime error

    //constants
    const [] + const {};  /// 07: static type warning, runtime error
    const ["1", 2] - const S(); /// 08: static type warning, runtime error

    //invocations
    method() + topLevelFunction(); /// 09: runtime error
    this.method()(1)(1, 2) - id[0]().x; /// 10: runtime error

    //multiplicative expressions
    true * false + id.id / [](); /// 10: static type warning, runtime error
    this[1] % null(1) - topLevelFunction()[0]++ ~/ {}()[0]; /// 10: static type warning, runtime error

    //unary expressions
    -this + ~this; /// 11: static type warning, runtime error
    --id - id++;  /// 12: runtime error
    ~-id + !!false;  /// 13: runtime error
    ++1[1] - ()=>2[0]--;  /// 14: static type warning, runtime error

    //identifier
    id + id - id;  /// 15: runtime error
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
