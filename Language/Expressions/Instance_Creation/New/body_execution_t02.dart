/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, the body of q is executed with respect to the bindings
 * that resulted from the evaluation of the argument list and the type
 * parameters (if any) of q bound to the actual type arguments V1, ..., Vl
 * resulting in an object i. The result of the evaluation of e is i.
 * @description Checks that type arguments are bound correctly.
 * @author msyabro
 * @reviewer rodionov
 */

class D {}

var p1;
var p2;
var p3;

abstract class I1<T, U, V> {
  factory I1() {
    return new A<T, U, V>();
  }
}

class A<T, U, V> implements I1<T, U, V> {
  A() {
    T x = p1;
    U y = p2;
    V z = p3;
  }
}

abstract class I2 <T extends A> {
  factory I2() {
    return new B<T>();
  }
}

class B <T extends A> implements I2<T> {
  B() {
  }
}

abstract class I3<T, U> {
  factory I3.name() {
    return new C<T, U>.name();
  }
}

class C<T, U> implements I3<T, U> {
  C.name() {
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
