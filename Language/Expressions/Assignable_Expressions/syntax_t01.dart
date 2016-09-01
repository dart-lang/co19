/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Assignable expressions are expressions that can appear on the
 * left hand side of an assignment.
 * assignableExpression:
 *   primary (arguments* assignableSelector)+ |
 *   super unconditionalAssignableSelector |
 *   identifier
 * ;
 * unconditionalAssignableSelector:
 *   '[' expression ']' |
 *   '.' identifier
 * ;
 * assignableSelector:
 *   unconditionalAssignableSelector |
 *   '?.' identifier
 * ;
 * An assignable expression is either:
 * • An identifier.
 * • An invocation (possibly conditional) of a getter or list access operator
 *   on an expression e.
 * • An invocation of a getter or list access operator on super.
 * @description Checks that expressions that fits into this grammar
 * can be used in the left hand side of an assignment.
 * @author msyabro
 * @reviewer kaigorodov
 * @note the test split into t01, t026, and t027
 */

topLevelFunction() {}

class S {
  const S();
}

class A {
  method() {}
  test() {
    //thisExpression
    this[0] = null; /// 01: static type warning, runtime error
    this.x = null; /// 02: static type warning, runtime error

    //nullLiteral
    null["key"] = null; /// 03: runtime error
    null.x = null; /// 04: runtime error

    //booleanLiteral
    true[1] = null; /// 05: static type warning, runtime error
    true.t = false; /// 06: static type warning, runtime error

    //numericLiteral
    1[1] = 1; /// 07: static type warning, runtime error
    1.num = 0; /// 08: static type warning, runtime error

    //stringLiteral
    "s"["s"] = null; /// 09: static type warning, runtime error
    "".c = "string"; /// 10: static type warning, runtime error

    //listLiteral
    [0, 1, 2, 3][1] = null;
    [].a = null; /// 11: static type warning, runtime error

    //identifier
    id["id"] = 0; /// 12: runtime error
    id.id = null; /// 13: runtime error

    //newExpression
    new A()[0] = null; /// 14: static type warning, runtime error
    new A().x = null; /// 15: static type warning, runtime error

    //constantObjectExpression
    const [1, 2, 3][0] = 1; /// 16: runtime error
    const S().x = null; /// 17: static type warning, runtime error

    //(functionInvocation)
    (topLevelFunction())[0] = null; /// 18: runtime error
    (topLevelFunction()).x = null; /// 19: runtime error

    //(methodInvocation)
    (this.method())[1] = null; /// 20: runtime error
    (this.method()).x = null; /// 21: runtime error

    //(assignmentExpression)
    (id = 2)[0] = null; /// 22: static type warning, runtime error
    (id += 1).x = null; /// 23: runtime error

    //(conditionalExpression)
    (true ? 1 : 2)[1] = null; /// 24: static type warning, runtime error
    (false ? "a" : "b").x = null; /// 25: static type warning, runtime error

    //(logicalBooleanExpression)
    (true || false)[0] = false; /// 26: static type warning, runtime error
    (false && true).x = true; /// 27: static type warning, runtime error

    //(bitwiseExpression)
    (id & 1)[0] = 1; /// 28: runtime error
    (id ^ 1).x = 1; /// 29: runtime error

    //(equalityExpression)
    (1 == 1)[0] = null; /// 30: static type warning, runtime error
    (identical(1, 1)).x = null; /// 31: static type warning, runtime error

    //(relationalExpression)
    (1 < 1)["a"] = 1; /// 32: static type warning, runtime error
    (2 <= 3).x = "x"; /// 33: static type warning, runtime error

    //(shiftExpression)
    (1 << 1)[0] = 1; /// 34: static type warning, runtime error
    (1 >> 1).x = 1; /// 35: static type warning, runtime error

    //(additiveExpression)
    (0 + 0)[0] = 1; /// 36: static type warning, runtime error
    (2 - 10).prop = null; /// 37: static type warning, runtime error

    //(multiplicativeExpression)
    (1 * 5)[4] = 1; /// 38: static type warning, runtime error
    (0 / 2).res = 1; /// 39: static type warning, runtime error

    //(unaryExpression)
    (id++)[0] = 1; /// 40: runtime error
    (id--).x = 1;  /// 41: runtime error

    //(isExpression)
    (1 is int)[0] = null; /// 42: static type warning, runtime error
    (1 is ! bool).id = 1; /// 43: static type warning, runtime error

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}
