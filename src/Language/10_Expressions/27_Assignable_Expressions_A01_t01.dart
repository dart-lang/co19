/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Assignable expressions are expressions that can appear on the left hand side of
 * an assignment.
 * assignableExpression:
 *   primary (arguments* assignableSelector)+ |
 *   super assignableSelector |
 *   identifier
 * ;
 * assignableSelector:
 *   '[' expression ']' |
 *   '.' identifier
 * ;
 * primary:
 *   thisExpression |
 *   super assignableSelector |
 *   functionExpression |
 *   literal |
 *   identifier |
 *   newExpression |
 *   constantObjectExpression |
 *   '(' expression ')'
 * ;
 * literal:
 *   nullLiteral |
 *   booleanLiteral |
 *   numericLiteral |
 *   stringLiteral |
 *   mapLiteral |
 *   listLiteral
 * ;
 * @description Checks that expressions that fits into this grammar
 * can be used in the left hand side of an assignment.
 * @static-warning
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
    try { this[0] = null; } catch(var e) {}
    try { this.x = null;  } catch(var e) {}

    //nullLiteral
    try { null["key"] = null; } catch(var e) {}
    try { null.x = null; } catch(var e) {}

    //booleanLiteral
    try {true[1] = null;} catch(var e) {}
    try {true.t = false;} catch(var e) {}

    //numericLiteral
    try {1[1] = 1;} catch(var e) {}
    try {1.num = 0;} catch(var e) {}

    //stringLiteral
    try { "s"["s"] = null;} catch(var e) {}
    try {"".c = "string";} catch(var e) {}

    //listLiteral
    try { [0, 1, 2, 3][1] = null; } catch(var e) {}
    try { [].a = null; } catch(var e) {}

    //identifier
    try { id["id"] = 0;} catch(var e) {}
    try { id.id = null;} catch(var e) {}

    //newExpression
    try { new A()[0] = null;} catch(var e) {}
    try { new A().x = null;} catch(var e) {}

    //constantObjectExpression
    try { const [1, 2, 3][0] = 1;} catch(var e) {}
    try { const S().x = null;} catch(var e) {}

    //(functionInvocation)
    try { (topLevelFunction())[0] = null;} catch(var e) {}
    try { (topLevelFunction()).x = null;} catch(var e) {}

    //(methodInvocation)
    try { (this.method())[1] = null; } catch(var e) {}
    try { (this.method()).x = null; } catch(var e) {}

    //(assignmentExpression)
    try { (id = 2)[0] = null;} catch(var e) {}
    try { (id += 1).x = null;} catch(var e) {}

    //(conditionalExpression)
    try { (true ? 1 : 2)[1] = null;} catch(var e) {}
    try { (false ? "a" : "b").x = null;} catch(var e) {}

    //(logicalBooleanExpression)
    try { (true || false)[0] = false;} catch(var e) {}
    try { (false && true).x = true; } catch(var e) {}

    //(bitwiseExpression)
    try { (id & 1)[0] = 1;} catch(var e) {}
    try { (id ^ 1).x = 1;} catch(var e) {}

    //(equalityExpression)
    try { (1 == 1)[0] = null;} catch(var e) {}
    try { (1 === 1).x = null;} catch(var e) {}

    //(relationalExpression)
    try { (1 < 1)["a"] = 1;} catch(var e) {}
    try { (2 <= 3).x = "x";} catch(var e) {}

    //(shiftExpression)
    try { (1 << 1)[0] = 1;} catch(var e) {}
    try { (1 >> 1).x = 1;} catch(var e) {}

    //(additiveExpression)
    try { (0 + 0)[0] = 1;} catch(var e) {}
    try { (2 - 10).prop = null;} catch(var e) {}

    //(multiplicativeExpression)
    try { (1 * 5)[4] = 1;} catch(var e) {}
    try { (0 / 2).res = 1;} catch(var e) {}

    //(unaryExpression)
    try { (id++)[0] = 1;} catch(var e) {}
    try { (id--).x = 1;} catch(var e) {}

    //(isExpression)
    try { (1 is int)[0] = null;} catch(var e) {}
    try { (1 is ! bool).id = 1;} catch(var e) {}

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}