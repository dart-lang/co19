/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Bitwise expressions invoke the bitwise operators on objects.
 * bitwiseOrExpression:
 *   bitwiseXorExpression ('|' bitwiseXorExpression)* |
 *   super ('|' bitwiseXorExpression)+
 * ;
 * bitwiseXorExpression:
 *   bitwiseAndExpression ('^' bitwiseAndExpression)* |
 *   super ('^' bitwiseAndExpression)+
 * ;
 * bitwiseAndExpression:
 *   shiftExpression ('&' shiftExpression)* |
 *   super ('&' shiftExpression)+
 * ;
 * bitwiseOperator:
 *   '&' |
 *   '^' |
 *   '|'
 * ;
 * A bitwise expression is either an shift expression, or an invocation of a
 * bitwise operator on either super or an expression e1, with argument e2.
 * @description Checks that various bitwise expression which are valid
 * according to this grammar don't cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

topLevelFunction() {}

class S {
  const S();
  operator |(var val) {return this;}
  operator &(var val) {return this;}
  operator ^(var val) {return this;}
}

class A extends S {
  method() {}
  var id;

  test() {
    //super
    super | this;
    super ^ 1 | 3;
    super & new Object() ^ true | 1;

    //literals
    1 & "1"; /// 01: static type warning, runtime error
    false | null; /// 02: static type warning, runtime error
    [1, 2, 3, 4] ^ {"1": 2, "3": 4}; /// 03: static type warning, runtime error

    //function expressions
    () {} | () => {}; /// 04: static type warning, runtime error
    // issue 1189
    () {return null;} & (int x) => 7; /// 05: static type warning, runtime error
    () => ({}) ^ () {}; /// 24: static type warning

    //constants and instance creation
    const [] | []; /// 06: static type warning, runtime error
    const {"a": 1} & {"a": 1}; /// 07: static type warning, runtime error
    const S() ^ new A();

    //invocation
    id ^ topLevelFunction(); /// 08: runtime error
    method() & topLevelFunction(); /// 09: runtime error
    method() | id; /// 10: runtime error

    //shift
    true * false; /// 11: static type warning, runtime error
    1 + 3 & 0;

    //relational expression is a higher grammar rule since spec 0.61
    //so these are not bitwise exprs, but relational exprs containing bitwise
    1 ^ 2 < true | false; /// 12: static type warning, runtime error
    true & false <= id ^ 7; /// 13: static type warning, runtime error

    //shift expressions
    id << method() & {}() >> [](); /// 14: static type warning, runtime error
    1 << 2 ^ null >> null; /// 15: runtime error

    // bitwise expressions
    1 | -1 | 1 | -1 | 1;
    1 & -1 & 1 & -1 & 1;
    1 ^ -1 ^ 1 ^ -1 ^ 1;
    1 ^ -1 | 1 & -1 & 1 | -1 ^ 1 | -1 ^ 1;

    //additive expressions
     1 + 2 ^ 2;
     0 - 0 | null + null; /// 16: runtime error
     [] + {} & 0; /// 17: static type warning, runtime error

    //multiplicative expressions
    true * false ^ id.id / [](); /// 18: static type warning, runtime error
    this[1] % null(1) & topLevelFunction()[0]++ ~/ {} ()[0]; /// 19: static type warning, runtime error
    0 ~/ 1 | 1 - -1;

    //unary expressions
    -this & ~this; /// 20: static type warning, runtime error
    --id | id++; /// 21: runtime error
    ~-id ^ !!false; /// 22: runtime error

    //identifier
     id ^ id | id & id; /// 23: runtime error
  }
}

main() {
  A a = new A();
  a.test();
}
