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
 * @description Checks that the result of a new expression is object i.
 * @author msyabro
 */

class Stub implements I1, I2{
  Stub() {}
  Stub.name() {}
}

interface I1 default A {
  I1();
}

class A {
  factory I1() {
    return new Stub();
  }
}

interface I2 default B{
  I2.name();
}

class B {
  factory I2.name() {
    return new Stub.name();
  }
}

main() {
  Expect.isTrue(new I1() is Stub);
  Expect.isTrue(new I2.name() is Stub);
}