/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any object whose type is a subtype of A can legally be returned 
 * from factory constructor of class A.
 * @description Trivial check.
 * @author iefremov
 * @reviewer msyabro
 */

class A {
  A() {}
  factory A.f(int x) {
    return new B(x);
  }
}

class B extends A {
  B(this.x) : super() {}
  var x;
}


void main() {
   Expect.isTrue(new A.f(42).x == 42);
}
