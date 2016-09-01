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
 *   '>>'
 * ;
 * A shift expression is either an additive expression, or an invocation
 * of a shift operator on either super or an expression e1, with argument e2.
 * @description Checks that various expressions fitted into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

topLevelFunction() {}

class S {
  const S();
  operator <<(var v) {}
  operator >>(var v) {}
}

class A extends S {
  method() {}
  get id {}
  set id(var v) {}

  test() {
    //super
    super << 1;
    super << (super >> []);

    //literal with selector is a postfix expr. is an additive expr.
    1()[0] << "string".string; /// 01: static type warning, runtime error
    true >> {"key1": 0, "key2": 1}; /// 02: static type warning, runtime error
    null >> false; /// 03: runtime error

    //constant literal is a primary is an additive expr.
    const [] >> const {}; /// 04: static type warning, runtime error
    const ["1", 2] << const S(); /// 05: static type warning, runtime error
    const [] >> 1; /// 06: static type warning, runtime error

    //invocation is a postfix expr. is an additive expr.
    method() >> topLevelFunction(); /// 07: runtime error
    1 << method()()(); /// 08: runtime error
    method() >> [1, 2]; /// 09: runtime error

    //additive expressions
     1 + 2 << 2;
     0 - 0 >> null + null; /// 10: runtime error
     [] + {} >> 0; /// 11: static type warning, runtime error

    //multiplicative expressions
    true * false << id.id / [](); /// 12: static type warning, runtime error
    this[1] % null(1) >> topLevelFunction()[0]++ ~/ {}()[0]; /// 13: static type warning, runtime error
    2 * 3 >> 0/0; /// 14: static type warning, runtime error

    //unary expressions
    -this >> ~this; /// 15: static type warning, runtime error
    --id << id++; /// 16: runtime error
    ~-id << !!false; /// 17: runtime error
    ++1[1] >> ()=>2[0]--; /// 18: static type warning, runtime error

    //function expression is a primary is an additive expr.
     ()=>0 >> 1;
     (var x) {} << 0.5;  /// 19: static type warning, runtime error
     () {return 0.5;} >> () => 1;  /// 20: static type warning, runtime error
  }
  var _id;
}

main() {
  A a = new A();
  a.test();
}
