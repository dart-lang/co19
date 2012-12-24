/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression evaluates one of two expressions
 * based on a boolean condition.
 * conditionalExpression:
 *   logicalOrExpression ('?' expressionWithoutCascade ':' expressionWithoutCascade)?
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
    try { 1 ? "" : true;} catch(e) {} /// static type warnings galore
    try { null ? [1, 2, 3] : {"1" : 2, "3" : 4};} catch(e) {}

    //function expressions
    try {() => 1 ? (int x) {return 1;} : () {};} catch(e) {}

    //constants and instance creation
    try { const [] ? const S() : new S();} catch(e) {}

    //invocations
    try { id ? topLevelFunction() : this.method();} catch(e) {}

    //assignment
    try {id = (2[0] = 2[1]) ? 3(3).x += 7 : id;} catch(e) {}

    //conditional
    try { (1 ? 2 : 3) ? 4 ? 5 : 6 : 7 ? 8 : 9;} catch(e) {}

    //logical boolean expressions
    try { (true || false) ? false && true : true || false;} catch(e) {}

    //bitwise expressions
    try { (1 | 2) ? "" ^ [] : (){} & this;} catch(e) {}

    //equality
    try { (identical(1, 1)) ? !identical(1, 2) : 1 == 2;} catch(e) {}

    //relational expressions
    try { (1 > 3) ? "2" < '7' : [1] >= [2];} catch(e) {}

    //shift
    try { (1 >> 1) ? true << false : false >> true;} catch(e) {}

    //additive expressions
    try {(1e10 + -0.5) ? [] - [] : {} + {};} catch(e){}

    //multiplicative expressions
    try {(true*false) ? 7 / 8 : new A() % const S(); } catch(e) {}

    //unary expressions
    try { id++?!!!false : -~-~-~true;} catch(e) {}

    //type test
    try {(true is bool) ? 1 is int : null is! Object;} catch(e) {}

    //identifier
    try {id ? id : id;} catch(e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
