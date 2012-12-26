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
    try { this[0] = null; } catch(e) {} /// static type warnings galore
    try { this.x = null;  } catch(e) {}

    //nullLiteral
    try { null["key"] = null; } catch(e) {}
    try { null.x = null; } catch(e) {}

    //booleanLiteral
    try {true[1] = null;} catch(e) {}
    try {true.t = false;} catch(e) {}

    //numericLiteral
    try {1[1] = 1;} catch(e) {}
    try {1.num = 0;} catch(e) {}

    //stringLiteral
    try { "s"["s"] = null;} catch(e) {}
    try {"".c = "string";} catch(e) {}

    //listLiteral
    try { [0, 1, 2, 3][1] = null; } catch(e) {}
    try { [].a = null; } catch(e) {}

    //identifier
    try { id["id"] = 0;} catch(e) {}
    try { id.id = null;} catch(e) {}

    //newExpression
    try { new A()[0] = null;} catch(e) {}
    try { new A().x = null;} catch(e) {}

    //constantObjectExpression
    try { const [1, 2, 3][0] = 1;} catch(e) {}
    try { const S().x = null;} catch(e) {}

    //(functionInvocation)
    try { (topLevelFunction())[0] = null;} catch(e) {}
    try { (topLevelFunction()).x = null;} catch(e) {}

    //(methodInvocation)
    try { (this.method())[1] = null; } catch(e) {}
    try { (this.method()).x = null; } catch(e) {}

    //(assignmentExpression)
    try { (id = 2)[0] = null;} catch(e) {}
    try { (id += 1).x = null;} catch(e) {}

    //(conditionalExpression)
    try { (true ? 1 : 2)[1] = null;} catch(e) {}
    try { (false ? "a" : "b").x = null;} catch(e) {}

    //(logicalBooleanExpression)
    try { (true || false)[0] = false;} catch(e) {}
    try { (false && true).x = true; } catch(e) {}

    //(bitwiseExpression)
    try { (id & 1)[0] = 1;} catch(e) {}
    try { (id ^ 1).x = 1;} catch(e) {}

    //(equalityExpression)
    try { (1 == 1)[0] = null;} catch(e) {}
    try { (identical(1, 1)).x = null;} catch(e) {}

    //(relationalExpression)
    try { (1 < 1)["a"] = 1;} catch(e) {}
    try { (2 <= 3).x = "x";} catch(e) {}

    //(shiftExpression)
    try { (1 << 1)[0] = 1;} catch(e) {}
    try { (1 >> 1).x = 1;} catch(e) {}

    //(additiveExpression)
    try { (0 + 0)[0] = 1;} catch(e) {}
    try { (2 - 10).prop = null;} catch(e) {}

    //(multiplicativeExpression)
    try { (1 * 5)[4] = 1;} catch(e) {}
    try { (0 / 2).res = 1;} catch(e) {}

    //(unaryExpression)
    try { (id++)[0] = 1;} catch(e) {}
    try { (id--).x = 1;} catch(e) {}

    //(isExpression)
    try { (1 is int)[0] = null;} catch(e) {}
    try { (1 is ! bool).id = 1;} catch(e) {}

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}
