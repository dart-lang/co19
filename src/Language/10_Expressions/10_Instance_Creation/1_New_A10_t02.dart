/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If q is a redirecting constructor, then: The argument list
 * (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated. Then, the redirect clause
 * of q is executed with respect to the bindings that resulted from the evaluation
 * of the argument list and the type parameters (if any) of C bound to the actual
 * type arguments V1, ... , Vm resulting in an object i that is necessarily the result
 * of another constructor call. The result of the evaluation of e is i.
 * @description Checks that type arguments are bound correctly when evaluating
 * the initializer list.
 * @author msyabro
 */

class D {}

var p1;
var p2;
var p3;

class A<T, U, V> {
  A():this.redirected();
  A.redirected(): x = p1, y = p2, z = p3 {}
  T x;
  U y;
  V z;
}

class B <T extends A> {
  B():this.redirected();
  B.redirected(): t = new A() {}
  T t;
}

class C<T, U> {
  C.name():this.redirected();
  C.redirected(): a = p1, b = p3 {}
  T a;
  U b;
}

main() {
  p1 = 1;
  p2 = "";
  p3 = new D();
  new A<int, String, D>();
  new B<A>();
  new C<int, D>.name();
}