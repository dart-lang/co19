/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion S is a supertype of T , written S :> T , iff T is a subtype of S.
 * @description Trivially checks that an interface extending some other
 * interface extends Object as well.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class I {}

class I2 implements I {}

class A implements I2 {}

main() {
  Expect.isTrue(new A() is Object);
  Expect.isTrue(new I2() is Object);
}
