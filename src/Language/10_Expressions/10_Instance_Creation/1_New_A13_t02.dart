/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion q is a factory constructor. Then the
 * argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated. Then,
 * the body of q is executed with respect to the bindings that resulted from the
 * evaluation of the argument list and the type parameters (if any) of q bound to
 * the actual type arguments V1, ... , Vm resulting in an object i. The result of the
 * evaluation of e is i.
 * @description Checks that type arguments are bound correctly.
 * @author msyabro
 */

class D {}

var p1;
var p2;
var p3;

interface I1<T, U, V> default A<T, U, V> {
  I1();
}

class A<T, U, V> {
  factory I1() {
    T x = p1;
    U y = p2;
    V z = p3;
  }
  A() {}
}

interface I2 <T> default B<T extends A> {
  I2();
}

class B <T extends A> {
  factory I2() {
    T t = new A();
  }
}

interface I3<T, U> default C<T, U> {
  I3.name();
}

class C<T, U> implements I3<T, U> {
  factory C.name() {
    T a = p1;
    U b = p3;
  }
}

main() {
  p1 = 1;
  p2 = "";
  p3 = new D();
  new I1<int, String, D>();
  new I2<A>();
  new I3<int, D>.name();
}