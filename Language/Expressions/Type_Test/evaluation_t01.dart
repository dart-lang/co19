/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the is-expression e is T proceeds as follows:
 * The expression e is evaluated to a value v.
 * Then, if T is malformed or deferred type, a dynamic error occurs.
 * Otherwise, if the interface of the class of v is a subtype of T, the
 * is-expression evaluates to true.
 * Otherwise it evaluates to false.
 * @description Checks that the is-expression is evaluated correctly.
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
  Expect.isTrue((1 + 2) is int);
  Expect.isTrue(1.0 is double);
  Expect.isTrue((1 < 2) is bool);
  Expect.isTrue("string" is String);
  Expect.isTrue(null is Object);
  Expect.isTrue(const [1, 2, 3] is List);
  Expect.isTrue(() {} is Function);
  Expect.isTrue(new Object() is dynamic);

  Expect.isTrue(new I() is I);
  Expect.isTrue(new I() is A);
  Expect.isTrue(new I() is C);
  Expect.isTrue(new A() is A);
  Expect.isTrue(new B() is B);
  Expect.isTrue(new B() is A);
  Expect.isTrue(new C() is I);
  Expect.isTrue(new C() is A);
  Expect.isTrue(new C() is B);
  Expect.isTrue(new C() is C);

  Expect.isTrue(new I() is Object);
  Expect.isTrue(new A() is Object);
  Expect.isTrue(new B() is Object);
  Expect.isTrue(new C() is Object);

  Expect.isFalse(null is int);
  Expect.isFalse(1 is String);
  Expect.isFalse("" is List);

  Expect.isFalse(new A() is C);
  Expect.isFalse(new B() is C);
  Expect.isFalse(new A() is I);

}
