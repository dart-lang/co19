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
 * @author msyabro
 * @reviewer rodionov
 */

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
    super >= 1 << 2;

    // additive and multiplicative expressions are allowed arguments
    // for a shift expression
    super >= 1 + 1 >> 2 * 2;

    //literal is primary is postfix expr. is shift expr.
    1 >= false; /// 01: static type warning, runtime error
    "abc" < null; /// 02: static type warning, runtime error
    [1, 2, 3] > {"key" : "value"}; /// 03: static type warning, runtime error
    this <= 0.25;

    //constant literal is primary is postfix expr. is shift expr.
    const [] > const {}; /// 04: static type warning, runtime error
    const ["1", 2] >= const S(); /// 05: static type warning, runtime error
    const [] < 1; /// 06: static type warning, runtime error
    const {"a": 1, "b": 2} <= 1; /// 07: static type warning, runtime error

    //invocation is postfix expr. is shift expr.
    method() > topLevelFunction(); /// 08: runtime error
    1 < method()()(); /// 09: runtime error
    method() >= [1, 2]; /// 10: runtime error
    topLevelFunction() <= 1; /// 11: runtime error

    //additive expression is a shift expr.
//    Expect.isFalse(1 + 2 < 2);
     0 - 0 > null + null; /// 12: runtime error
     [] + {} <= () {} - () => null; /// 13: static type warning, runtime error
     "" - '' >= 0; /// 14: static type warning, runtime error

    //multiplicative expression is a shift expr.
    true * false < id.id / [](); /// 15: static type warning, runtime error
    this[1] % null(1) > topLevelFunction()[0]++ ~/ {}()[0]; /// 16: static type warning, runtime error
    2 * 3 >= 0 / 0;
    0 ~/ 1 >= 1 - -1;

    //unary expression is a shift expr.
    -this > ~this; /// 17: static type warning, runtime error
    --id < id++; /// 18: runtime error
    ~-id >= !!false; /// 19: runtime error
    ++1[1] <= ()=>2[0]--; /// 20: static type warning, runtime error

    //identifier
    id < id; /// 21: runtime error
    id <= id; /// 22: runtime error
    id > id; /// 23: runtime error
    id >= id; /// 24: runtime error

    //function expression is primary is postfix expr. is shift expr.
    // issue 1189
    ()=>0 < 1;
    (var x) {} <= 0.5;  /// 25: static type warning, runtime error
    () {return 0.5;} > () => 1;  /// 26: static type warning, runtime error
    () {} >= () => null; /// 27: static type warning, runtime error
  }

  var _id;
}

main() {
  A a = new A();
  a.test();
}
