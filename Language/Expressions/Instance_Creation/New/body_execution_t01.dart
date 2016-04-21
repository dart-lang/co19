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
 * @description Checks that arguments of a constructor and instance variables
 * are bound correctly.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

int factoryA = 0;
int factoryB = 0;

abstract class I {
  factory I(p1, p2) {
    return new A.fctry(p1, p2);
  }
}

class C extends A {
  C(p1, p2) {}
}

class A implements I {
  A() {}
  factory A.fctry(p1, p2) {
    Expect.equals(3, p1);
    Expect.equals("ab", p2);
    ++factoryA;
    return new C(p1, p2);
  }
}

abstract class J {
  factory J.name(p1, p2) {
    return new B.name(p1, p2);
  }
}

class B implements J {
  B.name(p1, p2) {
    Expect.equals(10, p1);
    Expect.equals(false, p2);
    ++factoryB;
  }
}

main() {
  new I(1 + 2, "a" "b");
  new J.name(20/ 2, true && false);
  Expect.equals(1, factoryA);
  Expect.equals(1, factoryB);
}
