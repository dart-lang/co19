/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart allows injection of interfaces into a class or interface.
 * The type checker validates that the class actually implements the interface.
 * @description Basic check of interface injection into two classes with 'common' method.
 * @author iefremov
 * @reviewer msyabro
 */

class A {
  A() {}
  int action() { 
    return 42;
  }
}

class B {
  B() {}
  int action() {
    return 6031769;
  }
}

interface Actionable {
  int action();
}

class A implements Actionable;
class B implements Actionable;


void main() {
  Expect.isTrue(new A().action() == 42);
  Expect.isTrue(new B().action() == 6031769);
}
