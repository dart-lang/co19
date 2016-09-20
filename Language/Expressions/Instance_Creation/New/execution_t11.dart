/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Next, q is executed with this bound to i, the type parameters
 * (if any) of R bound to the actual type arguments V1, ..., Vm and the formal
 * parameter bindings that resulted from the evaluation of the argument list.
 * The result of the evaluation of e is i.
 * @description Checks that type arguments are bound correctly when evaluating
 * the initializer list of a redirected constructor.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class D {}

var p1;
var p2;
var p3;

class A<T, U, V> {
  A() : this.redirected();

  A.redirected(): x = p1, y = p2, z = p3 {
    Expect.equals(1, x);
    Expect.equals("", y);
    Expect.isNotNull(z);
    Expect.identical(p3, z);
    Expect.isTrue(z is D);
  }

  T x;
  U y;
  V z;
}

class B <T extends A> {
  B() : this.redirected();

  B.redirected(): t = new A() {
    Expect.isNotNull(t);
    Expect.isTrue(t is A);
  }

  A t;
}

class C<T, U> {
  C.name() : this.redirected();

  C.redirected(): a = p1, b = p3 {
    Expect.equals(p1, a);
    Expect.identical(p3, b);
    Expect.isNotNull(b);
    Expect.isTrue(b is D);
  }

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
