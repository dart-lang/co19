// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion An interface introduces a named type that classes can implement. An interface 
 * specifies a set of inherited interfaces, a set of instance method signatures, and a set of constants. 
 * @description Checks virtual calls through interfaces.
 * @author iefremov
 * @reviewer msyabro
 */

interface I1 {
}

interface I2 {
  I2 i2();
}

interface I3 extends I2 {}

interface I extends I1, I3 {
  I i();
}

class C implements I {
  C() {}
  void i2() {
    return this; 
  }
  void i() {
    return this;
  }
}


main() {
  C c = new C();
  I2 i2 = c;
  I3 i3 = c;
  I i = c;

  Expect.isTrue(c.i2() === c);
  Expect.isTrue(c.i() === c);

  Expect.isTrue(i2.i2() === c);
  Expect.isTrue(i3.i2() === c);

  Expect.isTrue(i.i2() === c);
  Expect.isTrue(i.i() === c);
}
