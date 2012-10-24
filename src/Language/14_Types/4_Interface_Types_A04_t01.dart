/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The supertypes of an interface are its direct supertypes and their supertypes.
 * @description Trivially checks that an interface extending some other interface extends Object as well.
 * @author iefremov
 * @reviewer rodionov
 */

abstract class I {}

abstract class I2 extends I {
  factory I2(return new A(););
}

class A implements I2 {
  A() {}
}

main() {
  Expect.isTrue(new I2() is Object);
}

