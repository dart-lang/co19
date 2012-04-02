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
 * @needsreview: TODO: add negative tests on expression with cascades once cascades are implemented
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
    try { 1 ? "" : true;} catch(var e) {}
    try { null ? [1, 2, 3] : {"1" : 2, "3" : 4};} catch(var e) {}

    //function expressions
    try {() => 1 ? void f(int x) {return 1;} : int g() {};} catch(var e) {}

    //constants and instance creation
    try { const [] ? const S() : new S();} catch(var e) {}

    //invocations
    try { id ? topLevelFunction() : this.method();} catch(var e) {}

    //assignment
    try {id = (2[0] = 2[1]) ? 3(3).x += 7 : id;} catch(var e) {}

    //conditional
    try { (1 ? 2 : 3) ? 4 ? 5 : 6 : 7 ? 8 : 9;} catch(var e) {}

    //logical boolean expressions
    try { (true || false) ? false && true : true || false;} catch(var e) {}

    //bitwise expressions
    try { (1 | 2) ? "" ^ [] : (){} & this;} catch(var e) {}

    //equality
    try { (1 === 1) ? 1 !== 2 : 1 == 2;} catch(var e) {}

    //relational expressions
    try { (1 > 3) ? "2" < '7' : [1] >= [2];} catch(var e) {}

    //shift
    try { (1 >> 1) ? true << false : false >> true;} catch(var e) {}

    //additive expressions
    try {(1e10 + -0.5) ? [] - [] : {} + {};} catch(var e){}

    //multiplicative expressions
    try {(true*false) ? 7 / 8 : new A() % const S(); } catch(var e) {}

    //unary expressions
    try { id++?!!!false : -~-~-~true;} catch(var e) {}

    //type test
    try {(true is bool) ? 1 is int : null is! Object;} catch(var e) {}

    //identifier
    try {id ? id : id;} catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}