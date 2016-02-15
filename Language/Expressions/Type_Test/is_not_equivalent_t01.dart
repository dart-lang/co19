/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The is-expression e is! T is equivalent to !(e is T).
 * @description Checks that the is!-expression is evaluated correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

abstract class I {
  factory I() {return new C();}
}

class A {
  A() {}
}
class B extends A {}
class C extends B implements I {}

main() {
  Expect.isFalse(1 is! int);
  Expect.isFalse(1.0 is! double);
  Expect.isFalse("string" is! String);
  Expect.isFalse(null is! Object);
  Expect.isFalse(() {} is! Function);
  Expect.isFalse(new Object() is! dynamic);

  Expect.isFalse(new I() is! I);
  Expect.isFalse(new I() is! A);
  Expect.isFalse(new I() is! C);
  Expect.isFalse(new A() is! A);
  Expect.isFalse(new B() is! B);
  Expect.isFalse(new B() is! A);
  Expect.isFalse(new C() is! I);
  Expect.isFalse(new C() is! A);
  Expect.isFalse(new C() is! B);
  Expect.isFalse(new C() is! C);

  Expect.isFalse(new I() is! Object);
  Expect.isFalse(new A() is! Object);
  Expect.isFalse(new B() is! Object);
  Expect.isFalse(new C() is! Object);

  Expect.isTrue(null is! int);
  Expect.isTrue(1 is! String);
  Expect.isTrue("" is! List);

  Expect.isTrue(new A() is! C);
  Expect.isTrue(new B() is! C);
  Expect.isTrue(new A() is! I);

}
