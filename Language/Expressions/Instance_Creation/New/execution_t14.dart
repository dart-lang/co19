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
 * @description Checks that result of a new expression with redirecting
 * constructor is instance of class C.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

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
