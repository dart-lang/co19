/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The supertypes of an interface are its direct supertypes and their supertypes.
 * @description Trivially checks that an interface extending some other interface extends its superinterfaces as well.
 * @author iefremov
 * @reviewer rodionov
 */

interface I0 {}

interface I1 extends I0 {}

interface I2 extends I1 factory A {
  I2();
}

class A implements I2 {}

main() {
  Expect.isTrue(new I2() is I0);
}
