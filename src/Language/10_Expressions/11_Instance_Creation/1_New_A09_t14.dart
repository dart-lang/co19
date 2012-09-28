/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For each instance variable f of i, if the variable declaration
 * of f has an initializer, then f is bound to that value
 * (which is necessarily a compile-time constant). Otherwise f is bound to null.
 * Next, the argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is
 * evaluated. Then, q is executed with this bound to i,
 * the type parameters (if any) of C bound to the actual type arguments V1, ..., Vm and
 * the formal parameters of q bound to the corresponding actual arguments.
 * The result of the evaluation of e is i.
 * @description Checks that result of a new expression with redirecting constructor
 * is instance of class C.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  A() : this.redirected();
  A.redirected() {}
}

class B {
  B(p1, p2) : this.redirected(p1, p2);
  B.redirected(p1, p2) {}
}

class C {
  C(p1, [p2]) : this.redirected(p1, p2);
  C.redirected(p1, [p2]) {}
}

class D {
  D.name() : this.redirected();
  D.redirected() {}
}

main() {
  Expect.isTrue(new A() is A);
  Expect.isTrue(new B(1, 2) is B);
  Expect.isTrue(new C(null, null) is C);
  Expect.isTrue(new D.name() is D);
}
