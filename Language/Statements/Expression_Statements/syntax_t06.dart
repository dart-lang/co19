/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression statement consists of an expression other than a
 * non-constant map literal that has no explicit type arguments.
 * The restriction on maps is designed to resolve an ambiguity in the grammar,
 *   expressionStatement:
 *     expression? ‘;’
 *   ;
 * Execution of an expression statement e; proceeds by evaluating e.
 * It is a compile-time error if a non-constant map literal that has no explicit
 * type arguments appears in a place where a statement is expected.
 * @description Checks that any expression except a map literal can form a
 * statement.
 * @author iefremov
 */
// SharedOptions=--enable-experiment=triple-shift

var v;
get g {}

class D {
  operator [](var x) {}
  check() {}
}

class C extends D{
  static s() {}
  static get sg {}
  var l;

  operator [](x) {
    const []; //list
    []; //list
    const <int>[];
    <C>[new C(), new C(), null];
    [[], [], [[]]];
    [[], [{}], [[{}], {}]];
    x = [];
  }

  f() {}

  test() {
    l;
    s();
    sg;
    test;
    toString;
    toString();
    super[0];
    this[1];
    super.check(); //super invocation
    f();
    this.f();

    this; //this
  }
}

class ConstClass {
  const ConstClass();
}

main() {
  local_f() {}

  //type test
  1 is int;
  1 is! bool;

  //identifier reference/assignable expressions
  v;
  g;
  C.s(); //static invocation
  C.s;
  local_f;
  new C().test(); //ordinary invocation
  new C().test; //property extraction

  //postfix expressions
  int i = 1;
  i--;
  i++;

  //unary expressions
  ++i;
  --i;
  -i;
  !true;

  //multiplicative
  i * 2;
  i / 1.0;
  i % 1;
  i ~/ 1;

  //additive
  i + 1;
  i - 0;

  //shift
  i << 1;
  i >> 0;

  //triple shift
  i >>> 0;

  //relational
  i < 0;
  i > 1;
  i <= 0;
  i >= 0;

  //equality
  identical(i, 1);
  !identical(i, 2);
  i == 0;
  i != 1;

  //bitwise
  i ^ 0;
  i | 2;
  i & 1;

  //logical
  var b = true;
  b && false;
  b || true;

  //conditional
  b ? true : false;
  b ? b : b;
  b ? b : !b;

  //compound assignment
  i *=  i;
  double d = 1.0;
  d /=  i;
  i ~/= i;
  i %=  i;
  i +=  i;
  i -=  i;
  int j = 2;
  j <<= 1;
  j >>= 2;
  j >>>= 1;
  j &=  42;
  j ^=  2;
  j |=  17;

  //assignment
  j = 1;

  //getter invocation
  j = g;

  //function expression invocation
  () {}();
  (() => i + 2)();

  //instance creation
  new C();
  const ConstClass();

  //function expression
  () => null;
  () {return null;};
  void f() {f();};

  //string interpolation
  "${i}";

  //strings
  r'''''';
  r"abryvalg";
  "abyr";
  '''abyr''';

  //booleans
  true;
  false;

  //numbers
  1;
  -2;
  3.14;
  0xCAFEBABE;

  //null
  null;
}
