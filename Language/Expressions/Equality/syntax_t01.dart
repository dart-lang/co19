/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Equality expressions test objects for equality.
 * equalityExpression:
 *   relationalExpression (equalityOperator relationalExpression)? |
 *   super equalityOperator relationalExpression
 * ;
 * equalityOperator:
 *   '==' |
 *   '!='
 * ;
 * An equality expression is either a relational expression, or an invocation of
 * an equality operator on either super or an expression e1, with argument e2.
 * @description Checks that various equality expression which are valid
 * according to this grammar don't cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

topLevelFunction() {}

class S {
  const S();
}

class A extends S {
  method() {}
  var id;

  test() {
    //super - issue 1242
    super == this;
    super != 1;

    //literals
    1 == "1";
    false != null;

    //function expressions -- issue 1189
    () {} == () => {};
    () {return null;} == (int x) => 7;
    () => [] != 1;
    () {} != new Object();

    //constants and instance creation
    const [] == [];
    new A() != new A();

    //invocation
    id == topLevelFunction();
    method() != id;

    //relational expressions
    1 < 2 == true > false; /// 01: static type warning, runtime error
    true >= false == id > 7; /// 02: static type warning, runtime error

    //shift expressions
    1 >> -1 != () {}; /// 03: runtime error
    1 << 2 != null >> null; /// 04: runtime error

    //additive expressions
     1 + 2 == 2;
     0 - 0 != null + null; /// 05: runtime error

    //multiplicative expressions
    true * false == id.id / [](); /// 06: static type warning, runtime error
    0 ~/ 1 != 1 - -1;

    //unary expressions
    -this == ~this; /// 07: static type warning, runtime error
    ~-id != !!false; /// 08: runtime error
  }
}

main() {
  A a = new A();
  a.test();
}
