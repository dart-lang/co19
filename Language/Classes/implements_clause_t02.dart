/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class may implement a number of interfaces by declaring them 
 * in its implements clause.
 * @description Checks that class can implement one or more interfaces.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";

class I1 {}
class I2 {}
class I3 {}

class A {}
class B implements I1 {}
class C implements I1, I2 {}
class D extends A implements I1, I2, I3 {}

main() {
  A a = new A();
  B b = new B();
  C c = new C();
  D d = new D();
  Expect.isTrue(b is I1);
  Expect.isTrue(c is I1);
  Expect.isTrue(c is I2);
  Expect.isTrue(d is I1);
  Expect.isTrue(d is I2);
  Expect.isTrue(d is I3);
}
