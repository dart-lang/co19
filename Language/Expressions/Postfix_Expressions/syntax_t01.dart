/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Postfix expressions invoke the postfix operators on objects.
 * postfixExpression:
 *   assignableExpression postfixOperator |
 *   primary (selector* | (‘#’ ( (identifier ‘=’?) | operator)))
 * ;
 * postfixOperator:
 *   incrementOperator
 * ;
 * selector:
 *   assignableSelector |
 *   arguments
 * ;
 * incrementOperator:
 *   '++' |
 *   '--'
 * ;
 * A postfix expression is either a primary expression, a function, method or
 * getter invocation, or an invocation of a postfix operator on an expression e.
 * @description Checks that any assignableExpression can be used with
 * postfixOperator.
 * See tests 10_27_Assignable_Expressions_A01_t0[1-3].dart
 * @author msyabro
 * @issue 2709
 */

class S {
  S() : x = 1;
  operator [](var ind) {return x;}
  operator []=(var ind, var val) {x = val;}
  var x;
}

class C {
  const C();
  const C.c2();
}

class A  extends S {
  A() : id = 1;
  method() {}
  var id;

  test() {
    //identifier
    id++;
    id--;

    //super
    super[0];
    super.x;
    super[0]++; // issue 1300
    super.x--; // issue 1300

    //thisExpression
    try { this[0];} catch (e) {}
    try { this.x;} catch (e) {}
    try { this[0]--;} catch (e) {}
    try { this.x++;} catch (e) {}

    //mapLiteral
    try { true ? {"1" : 1, "2" : 2}["1"]++ : null; } catch (e) {}

    //listLiteral
    try { [0, 1, 2, 3][1]; } catch (e) {}
    try { [0, 1, 2, 3][1]++; } catch (e) {}
    try { const [1, 2, 3][0];} catch (e) {}
    try { const [1, 2, 3][0]--;} catch (e) {}

    //identifier
    try { id["id"];} catch (e) {}
    try { id.id;} catch (e) {}
    try { id["id"]++;} catch (e) {}
    try { id.id--;} catch (e) {}

    //newExpression
    try { new A()[0];} catch (e) {}
    try { new A().x;} catch (e) {}
    try { new A()[0]--;} catch (e) {}
    try { new A().x++;} catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
