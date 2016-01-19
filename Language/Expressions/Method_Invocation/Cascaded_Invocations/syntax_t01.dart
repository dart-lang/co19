/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation has the form e..suffix where e is
 * an expression and suffix is a sequence of operator, method, getter or
 * setter invocations.
 * cascadeSection:
 *   '..'  (cascadeSelector arguments*)(assignableSelector arguments*)*
 * (assignmentOperator expressionWithoutCascade)?
 * ;
 * cascadeSelector:
 *   '[' expression ']' |
 *   identifier
 * ;
 * @description Checks that various correct cascaded invocations do not
 * produce compile-time errors.
 * @author msyabro
 * @reviewer iefremov
 */

class C {
  m1() {}
  m2(p1, p2) {}
  m3(p1, [p2]) {}

  operator +(other) {}
  operator -() {}
  operator [](index) {}
  operator []=(index, value) {}

  get x {}
  get y {}

  set x(v) {}
  set y(v) {}

  static statMethod() {}
  static var statVar;
}

main() {
  var o = new C();

  //instance methods
  o..m1();
  o..m2(1, 1);
  o..m3(1, 1);

  o..m1()..m2(1, 1)..m3(1);
  o..m2(0, 0)..m3(0, 1);
  o..m1()..m1()..m1();

  //getters
  o..x..y;
  o..x;
  o..x..x..x;

  //setters
  o..x = 1;
  o..x = 1..y = 2;
  o..x = 1..x = 'string'..x = [1, 2, 3];

  o..[1]..[2];
  o..[1] = 1..[2] = 2;
}
