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
 * @description Checks that the result of a new expression is object i.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class Stub implements A, B {
  Stub() {}
  Stub.name() {}
}

abstract class I1 {
  factory I1() = A;
}

class A implements I1 {
  factory A() {
    return new Stub();
  }
}

abstract class I2 {
  factory I2.name() = B.name;
}

class B implements I2 {
  factory B.name() {
    return new Stub.name();
  }
}

main() {
  Expect.isTrue(new I1() is Stub);
  Expect.isTrue(new I2.name() is Stub);
}
