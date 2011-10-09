/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Argument expression can be passed to a function whose formal parameter at that position
 * has a type that is assignable to the type of the expression. 
 * Otherwise, a type warning must be produced during static analysis. 
 * @description Class B is assignble to class A
 * @author msyabro
 * @reviewer akuznecov
 */

class A {
  A() {}
}

class B extends A {
  B():super() {}
}


void func(A a) {}

void main() {
  B b = new B();
  func(b);
}
