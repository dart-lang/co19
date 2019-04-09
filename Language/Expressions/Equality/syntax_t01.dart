/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Equality expressions test objects for equality.
 * equalityExpression:
 *   relationalExpression (equalityOperator relationalExpression)? |
 *   super equalityOperator relationalExpression
 * ;
 * equalityOperator:
 *   '==' |
 *   '!='
 * ;
 * An equality expression is either a relational expression, or an invocation of
 * an equality operator on either super or an expression e1, with argument e2.
 * @description Checks that various equality expression which are valid
 * according to this grammar don't cause compile-time errors.
 * @author msyabro
 */
// SharedOptions=--enable-experiment=triple-shift

topLevelFunction() {}

class S {
  const S();
}

class A extends S {
  method() {}
  var id;

  test() {
    //super - issue 1242
    super == this;
    super != 1;

    //literals
    1 == "1";
    false != null;

    //function expressions -- issue 1189
    () {} == () => {};
    () {return null;} == (int x) => 7;
    () => [] != 1;
    () {} != new Object();

    //constants and instance creation
    const [] == [];
    new A() != new A();

    //invocation
    id == topLevelFunction();
    method() != id;

    //shift expressions
    try {1 >> -1 != () {};} catch (e) {}
    try {1 << 2 != null >> null;} catch (e) {}

    //triple shift expressions
    try {1 >>> 2 != () {};} catch (e) {}

    //additive expressions
    try { 1 + 2 == 2;} catch (e) {}
    try { 0 - 0 != null + null;} catch (e) {}

    //multiplicative expressions
    try {0 ~/ 1 != 1 - -1;} catch (e) {}

    //unary expressions
    try {~-id != !!false;} catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
