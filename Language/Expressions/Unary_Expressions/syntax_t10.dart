/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   preﬁxOperator unaryExpression |
 *   awaitExpression |
 *   postﬁxExpression |
 *   (minusOperator | tildeOperator) super |
 *   incrementOperator assignableExpression
 * ;
 * preﬁxOperator:
 *   minusOperator |
 *   negationOperator |
 *   tildeOperator
 * ;
 * minusOperator:
 *   ‘-’ |
 * ;
 * negationOperator:
 *   ‘!’ |
 * ;
 * tildeOperator:
 *   ‘˜’
 * ;
 * A unary expression is either a postfix expression, an await expression or
 * an invocation of a prefix operator on an expression or an invocation of a
 * unary operator on either super or an expression e.
 * @description Checks that unary expressions of the form
 * [incrementOperator assignableExpression] don't cause compile-time errors.
 * @author msyabro
 */

class S {
  S() : x = 1;
  operator [](var ind) {return x;}
  operator []=(var ind, var val) {x = val;}
  var x;
}

class A  extends S{
  A() : id = 1;
  method() {}

  test() {
    //identifier
    ++id;
    --id;

    //invocation of getter or list access on super
    --super.x; // issue 1300
    ++super[0]; // issue 1300

    //invocation of a method, getter or list access operator on an expression e.

    //thisExpression
    try { --this[0]; } catch (e) {}
    try { ++this.x;  } catch (e) {}

    //mapLiteral
    try { ++{"1" : 1, "2" : 2}["1"]; } catch (e) {}

    //listLiteral
    try { ++[0, 1, 2, 3][1]; } catch (e) {}

    //identifier
    try { ++id["id"];} catch (e) {}
    try { --id.id;} catch (e) {}

    //newExpression
    try { --new A()[0];} catch (e) {}
    try { ++new A().x;} catch (e) {}

    //constantObjectExpression
    try { --const [1, 2, 3][0];} catch (e) {}

    //methodInvocation
    try { ++this.method()[1]; } catch (e) {}
    try { --this.method().x; } catch (e) {}

    //(...)
    try { --(id += 1).x;} catch (e) {}
    try { --(super.x)[0];} catch (e) {}
    try { ++(id & 1)[0];} catch (e) {}
    try { ++(id++)[0];} catch (e) {}

  }
  var id;
}

main() {
  A a = new A();
  a.test();
}
