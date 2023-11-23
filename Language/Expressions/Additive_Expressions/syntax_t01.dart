// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Additive expressions invoke the addition operators on objects.
/// additiveExpression:
///   multiplicativeExpression (additiveOperator multiplicativeExpression)* |
///   super (additiveOperator multiplicativeExpression)+
/// ;
/// additiveOperator:
///   '+' |
///   '-'
/// ;
/// An additive expression is either a multiplicative expression, or an
/// invocation of an additive operator on either super or an expression e1, with
/// argument e2.
/// @description Checks that various expressions fitted into this grammar don't
/// cause compile-time errors.
/// @author msyabro


topLevelFunction() {}

class S {
  const S();
  operator +(var x){}
  operator -(var x) {}
  operator [](var idx) {}
  final foo = 1;
}

class A extends S {
  method() {}
  get id {}
  set id(var v) {}

  test() {
    //super is a primary
    super + 0;
    super - super[0];

    // chaining
    try { super + 0 - 1 + {} - null; } catch(e) {}

    // (...)
    try { (this) + (1 ^ 0 & 4) - (1 <= 0); } catch(e) {}

    //invocations
    try { method() + topLevelFunction(); } catch(e) {}
    try { this.method()(1)(1, 2) - id[0]().x; } catch(e) {}


    //unary expressions
    try { --id - id++; } catch(e) {}
    try { ~-id + !!false; } catch(e) {}

    //identifier
    try { id + id - id; } catch(e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
