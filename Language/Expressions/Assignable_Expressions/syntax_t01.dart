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

topLevelFunction() => ["x"];

class S {
  const S();
}

class A {
  method() => ["y"];
  test() {
    var ident = [""];

    //listLiteral
    [0, 1, 2, 3][1] = null;

    //identifier
    ident[0] = "Lily was here";

    //constantObjectExpression
    const c = 1;

    //(functionInvocation)
    (topLevelFunction())[0] = null;

    //(methodInvocation)
    (this.method())[0] = null;
    (this.method()).length = 2;
  }
}

main() {
  A a = new A();
  a.test();
}
