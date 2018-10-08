/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Function invocation involves evaluation of the list of actual
 * arguments to the function and binding of the results to the functions
 * formal parameters.
 * arguments:
 *   '(' argumentList? ')'
 * ;
 * argumentList:
 *   namedArgument (', ' namedArgument)* |
 *   expressionList (', ' namedArgument)*
 * ;
 * namedArgument:
 *   label expression
 * ;
 * @description Checks that various arguments which fit into the grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

f() {}
positionalParameters(p1, p2, [p3]) {}
namedParameters({name1, $$$, u__}) {}
bothParameters(p1, {name}) {}

class A {
  const A(): v = 1;
  static sm() {}
  m() {}

  final v;
}

main() {
  var o = new A();
  f();

  //literals
  positionalParameters(null, "", 1);
  namedParameters(name1: [], $$$: {}, u__: false);
  bothParameters(true, name: {"key1": 1, "key2": 2});

  //functionExpressions
  positionalParameters(()=>[], () {}, (param) {});
  namedParameters($$$: (x) {return x + 1;}, u__: () => 1, name1: ()=> ()=> 1);
  bothParameters(() => 1 + 1, name: () {return true;});

  //constants and instance creation
  positionalParameters(const [1, 2], const {}, const A());
  namedParameters(u__: const [], $$$: new A(), name1: const A());
  bothParameters(const {"1": 2}, name: new A());

  //invocation
  positionalParameters(f(), A.sm(), o.m());
  namedParameters(name1: o.v, $$$: f(), u__: positionalParameters(1, 1, 1));
  bothParameters(o.v, name: f());

  //assignment and equality
  positionalParameters(1 == 2, true != false, identical([], null));

  //logical and relational expressions
  positionalParameters(1 < 2, 2 > 3, 3 <= 4);

  //bitwise and shift expressions
  bothParameters(1 << 1, name: 2 | -2);

  //additive expressions
  positionalParameters(1 + 2, 0.0 - 3, -0.4 - 11);
  bothParameters(1e3 + 0.2, name: 1 - 1);

  //multiplicative expressions
  positionalParameters(2 * 3, 1 /2, 0 % 7);
  namedParameters(name1: 1 ~/ 1, $$$: 0 * 0, u__: 0 / 8);
}
