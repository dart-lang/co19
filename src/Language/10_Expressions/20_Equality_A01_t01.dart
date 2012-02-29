/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Equality expressions test objects for identity or equality.
 * equalityExpression:
 *   relationalExpression (equalityOperator relationalExpression)? |
 *   super equalityOperator relationalExpression
 * ;
 * equalityOperator:
 *   '==' |
 *   '!=' |
 *   '===' |
 *   '!=='
 * ;
 * An equality expression is either a relational expression, or an invocation of
 * a equality operator on either super or an expression e1, with argument e2.
 * @description Checks that various expression fitted into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @needsreview issue 1242
 */

topLevelFunction() {}

class S {
  const S();
}

class A extends S {
  method() {}
  var id;

  test() {
    //super
    super == this;
    super != 1;
    super === new Object();
    super !== 1;

    //literals
    1 == "1";
    false != null;
    [1, 2, 3, 4] === {"1": 2, "3": 4};
    true !== false;

    //function expressions
    (){} == ()=>{};
    void f() {return null;} === void g(int x) => 7;
    () => [] != 1;
    int func() {} !== new Object();

    //constants and instance creation
    const [] == [];
    const {"a": 1} === {"a": 1};
    const S() !== this;
    new A() != new A();

    //invocation
    id == topLevelFunction();
    method() === topLevelFunction();
    id !== id;
    method() != id;

    //assignment and equality
    try {(1[1] = 2) === (1 === 2);} catch(var e) {}
    try {(id !== id) == (true == false);} catch(var e) {}
    try {(3(2(1)) != 1(2(3))) != 0;} catch(var e) {}
    try {(id = _id) !== id;} catch(var e) {}

    //logical and relational expressions
    try {(1 < 2) == (true > false ? 1 : id);} catch(var e) {}
    try {(true >= false) === ([] && {});} catch(var e) {}
    try {(null || this) != (id > 7);} catch(var e) {}
    try {(1 && 1) !== (2 || 2);} catch(var e) {}

    //bitwise and shift expressions
    try {(1[1] ^ 2(2)) == (new S() & true);} catch(var e) {}
    try {(id | method())=== null;} catch(var e) {}
    try {({}() >> []()) !=(){};} catch(var e) {}
    try {(1 << 2) != (null >> null);} catch(var e) {}

    //additive expressions
    try { (1 + 2) == 2;} catch(var e ) {}
    try { (0 - 0) != (null + null);} catch(var e ) {}
    try { ([] + ({} === (){})) === 0;} catch(var e ) {}
    try { ("" - '') !== 0;} catch(var e ) {}

    //multiplicative expressions
    try {(true * false) == (id.id / []());} catch(var e) {}
    try {(this[1] % null(1)) === ((topLevelFunction()[0]++) ~/ {}()[0]);} catch(var e) {}
    try {(2 * 3) !== (0/0);} catch(var e) {}
    try {(0 ~/ 1) != (1 - -1);} catch(var e) {}

    //unary expressions
    try {(-this) == (~this);} catch(var e) {}
    try {(--id) === (id++);} catch(var e) {}
    try {(~-id) != (!!false);} catch(var e) {}
    try {(++1[1]) !== (()=>2[0]--);} catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
