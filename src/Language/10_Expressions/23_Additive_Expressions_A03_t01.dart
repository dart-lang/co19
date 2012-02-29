/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An additive expression of the form super op e2 is equivalent
 * to the method invocation super.op(e2).
 * @description Checks that an expression of the form super + e2 is
 * equivalent to the method invocation super.operator+(e2).
 * @author kaigorodov
 */

int counter=0;

class S {
  final value;
  const S(var v):value=v;
  operator+(var v) {
    counter+=1;
    return new A(value+v);
  }
  operator-(var v) {
    counter+=2;
    return new A(v-value);
  }
}

class A extends S {
  A(var v) : super(v) {}
  test() {
    super + 5;
    super - 4;
    Expect.equals(3, counter);
  }
}

main() {
  A a = new A(2);
  a.test();
}