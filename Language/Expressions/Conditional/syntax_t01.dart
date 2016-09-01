/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression evaluates one of two expressions
 * based on a boolean condition.
 * conditionalExpression:
 *   ifNullExpression ('?' expressionWithoutCascade ':'
 * expressionWithoutCascade)?
 * ;
 * @description Checks that various expressions fitted into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 */

topLevelFunction() {}

class S {
  const S();
}

class A {
  method() {}
  var id;

  test() {
    //literals
    1 ? "" : true; /// 01: static type warning, dynamic type error
    null ? [1, 2, 3] : {"1" : 2, "3" : 4}; /// 02: dynamic type error

    //function expressions
    () => 1 ? (int x) {return 1;} : () {}; /// 14: static type warning

    //constants and instance creation
    const [] ? const S() : new S(); /// 03: static type warning, dynamic type error

    //invocations
    id ? topLevelFunction() : this.method(); /// 04: dynamic type error

    //assignment
    id = (2[0] = 2[1]) ? 3(3).x += 7 : id; /// 05: static type warning, runtime error

    //conditional
    (1 ? 2 : 3) ? 4 ? 5 : 6 : 7 ? 8 : 9; /// 06: static type warning, dynamic type error

    //logical boolean expressions
    (true || false) ? false && true : true || false;

    //bitwise expressions
    (1 | 2) ? "" ^ [] : () {} & this;  /// 07: static type warning, runtime error

    //equality
    (identical(1, 1)) ? !identical(1, 2) : 1 == 2;

    //relational expressions
    (1 > 3) ? "2" < '7' : [1] >= [2]; /// 08: static type warning, runtime error

    //shift
    (1 >> 1) ? true << false : false >> true; /// 09: static type warning, runtime error

    //additive expressions
    (1e10 + -0.5) ? [] - [] : {} + {}; /// 10: static type warning, runtime error

    //multiplicative expressions
    (true*false) ? 7 / 8 : new A() % const S(); /// 11: static type warning, runtime error

    //unary expressions
    id++ ? !!!false : -~-~-~true; /// 12: static type warning, runtime error

    //type test
    (true is bool) ? 1 is int : null is! Object;

    //identifier
    id ? id : id;  /// 13: dynamic type error
  }
}

main() {
  A a = new A();
  a.test();
}
