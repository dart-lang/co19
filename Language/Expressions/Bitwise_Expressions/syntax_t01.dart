/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Bitwise expressions invoke the bitwise operators on objects.
 * bitwiseOrExpression:
 *   bitwiseXorExpression ('|' bitwiseXorExpression)* |
 *   super ('|' bitwiseXorExpression)+
 * ;
 * bitwiseXorExpression:
 *   bitwiseAndExpression ('^' bitwiseAndExpression)* |
 *   super ('^' bitwiseAndExpression)+
 * ;
 * bitwiseAndExpression:
 *   shiftExpression ('&' shiftExpression)* |
 *   super ('&' shiftExpression)+
 * ;
 * bitwiseOperator:
 *   '&' |
 *   '^' |
 *   '|'
 * ;
 * A bitwise expression is either an shift expression, or an invocation of a
 * bitwise operator on either super or an expression e1, with argument e2.
 * @description Checks that various bitwise expression which are valid
 * according to this grammar don't cause compile-time errors.
 * @author msyabro
 */
// SharedOptions=--enable-experiment=triple-shift

topLevelFunction() {}

class S {
  const S();
  operator |(var val) {return this;}
  operator &(var val) {return this;}
  operator ^(var val) {return this;}
}

class A extends S {
  method() {}
  var id;

  test() {
    //super
    super | this;
    try {super ^ 1 | 3; } catch (e) {}
    try {super & new Object() ^ true | 1; } catch (e) {}

    //constants and instance creation
    try {const S() ^ new A();} catch (e) {}

    //invocation
    try {id ^ topLevelFunction();} catch (e) {}
    try {method() & topLevelFunction();} catch (e) {}
    try {method() | id;} catch (e) {}

    //shift
    try {1 + 3 & 0;} catch (e) {}

    // shift expressions
    try {1 << 2 ^ null >> null;} catch (e) {}

    // bitwise shift expressions
    try {144 >>> 2 ^ null >> null;} catch (e) {}

    // bitwise expressions
    1 | -1 | 1 | -1 | 1;
    1 & -1 & 1 & -1 & 1;
    1 ^ -1 ^ 1 ^ -1 ^ 1;
    1 ^ -1 | 1 & -1 & 1 | -1 ^ 1 | -1 ^ 1;

    //additive expressions
    try { 1 + 2 ^ 2;} catch (e) {}
    try { 0 - 0 | null + null;} catch (e) {}

    //multiplicative expressions
    try {0 ~/ 1 | 1 - -1;} catch (e) {}

    //unary expressions
    try {--id | id++;} catch (e) {}
    try {~-id ^ !!false;} catch (e) {}

    //identifier
    try { id ^ id | id & id;} catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
