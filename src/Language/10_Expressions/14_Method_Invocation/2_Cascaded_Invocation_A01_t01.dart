/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation has the form e..suffix where suffix is a sequence
 * of operator, method, getter or setter invocations.
 * cascadeSection:
 *   '..'  (assignableSelector arguments*)+ (assignmentOperator expression)?
 * ;
 * @description Checks that various correct cascaded invocations
 * does not produce compile-time errors.
 * @author msyabro
 * @reviewer iefremov
 */

class C {
  m1() {}
  m2(p1, p2) {}
  m3(p1, [p2]) {}

  operator+(other) {}
  operator negate() {}
  operator[](index) {}
  operator[]=(index, value) {}
  operator call(p1, p2, p3) {}

  get x() {}
  get y() {}

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
  o..m3(1, p2: 1);

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

  //operators
//  o..+ 1..+ 2..+ 3;
//  o..negate()..-; //Can one invoke negate as an unary minus here?
//  o..(null, null, null)..call(1, 2, 3);
  o..(null, null, null);

  o..[1]..[2];
  o..[1] = 1..[2] = 2;
//  o.. + 1 .. [2] .. [3] = 3 .. negate() .. ([], {}, []);

  //static fields
  o..statMethod();
  o..statVar;
  o..statMethod()..statVar..statMethod();

  o.. m1() .. + 2 .. [1] .. y = x .. statVar .. x .. m2(1, 2);

}

