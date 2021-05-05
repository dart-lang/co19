// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

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
  operator +(var x) => this;
  operator -(var x) => this;
  operator ~() => this;
  operator -() => this;
  operator [](var idx) => this;
  call([arg1, arg2]) => this;
  final foo = 1;
  final x = 1;
}

class A extends S {
  method() => A();
  get id => A();
  set id(var v) {}

  test() {
    //super is a primary
    super + 0;
    super - super[0];

    // chaining
    super + 0 - 1 + {} - null;

    // (...)
    (this) + (1 ^ 0 & 4) - (1 <= 0);

    //invocations
    method() + topLevelFunction();
    this.method()(1)(1, 2) - id[0]().x;

    //unary expressions
    --id - id++;
    ~-id + !!false;

    //identifier
    id + id - id;
  }
}

main() {
  A a = new A();
  a.test();
}
