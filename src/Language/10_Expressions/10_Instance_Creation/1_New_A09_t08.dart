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
 * evaluated. Then, the initializer list of q is executed with respect to the bindings
 * that resulted from the evaluation of the argument list, and with this bound to
 * i and the type parameters (if any) of C bound to the actual type arguments
 * V1, ... , Vm. Finally, the body of q is executed with respect to the bindings that
 * resulted from the evaluation of the argument list. The result of the evaluation
 * of e is i.
 * @description Checks that the result of a new expression is i.
 * @author msyabro
 */


class A {}

class B {
  B(p1, p2) {}
}

class C {
  C(p1, [p2]) {}
}

class D {
  D.name() {}
}

main() {
  Expect.isTrue(new A() is A);
  Expect.isTrue(new B(1, 2) is B);
  Expect.isTrue(new C(null, null) is C);
  Expect.isTrue(new D.name() is D);
}