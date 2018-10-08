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
 */

topLevelFunction() {}

class S {
  const S();
}

class A {
  method() {}
  test() {

    //nullLiteral
    null["key"] = null;
    null.x = null;

    //listLiteral
    [0, 1, 2, 3][1] = null;

    //identifier
    id["id"] = 0;
    id.id = null;

    //constantObjectExpression
    const [1, 2, 3][0] = 1;

    //(functionInvocation)
    (topLevelFunction())[0] = null;
    (topLevelFunction()).x = null;

    //(methodInvocation)
    (this.method())[1] = null;
    (this.method()).x = null;

    //(assignmentExpression)
    (id += 1).x = null;

    //(bitwiseExpression)
    (id & 1)[0] = 1;
    (id ^ 1).x = 1;

    //(unaryExpression)
    (id++)[0] = 1;
    (id--).x = 1;
  }
  var id;
}

main() {
  A a = new A();
  a.test();
}
