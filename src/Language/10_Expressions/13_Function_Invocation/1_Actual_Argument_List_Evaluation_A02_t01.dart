/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an actual argument list of the form
 * (a1, ... , am, q1 : am+1, ... , ql : am+l) proceeds as follows:
 * The arguments a1, ... , am+l are evaluated in the order they appear in the
 * program, yielding objects o1, ... , om+l.
 * @description Checks that expressions in an argument list are evaluated
 * in the order of appearance, from left to right and separately from each other.
 * @author msyabro
 * @reviewer rodionov
 */

String buffer;

func(p1, p2, [p3, p4]) {}

class A {
  operator+(otherOperand) {
    buffer += "A";
  }
  operator-(otherOperand) {
    buffer += "B";
  }
  operator*(otherOperand) {
    buffer += "C";
  }
  operator/(otherOperand) {
    buffer += "D";
  }
}

A foo() {
  return new A();
}

bar(x, y) {
  Expect.isTrue(x !== y);
}

main() {
  buffer = "";
  func(new A() + 1, new A() - 1, p4: new A() * 1, p3: new A() / 1);
  Expect.equals("ABCD", buffer);

  // shuffle the named arguments
  buffer = "";
  func(new A() + 1, new A() - 1, p3: new A() * 1, p4: new A() / 1);
  Expect.equals("ABCD", buffer);
  
  bar(foo(), foo());
}
