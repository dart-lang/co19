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
import "../../Utils/expect.dart";

class I0 {}

class I1 implements I0 {}

class I2 implements I1 {}

class A implements I2 {}

main() {
  Expect.isTrue(new A() is I1);
  Expect.isTrue(new A() is I0);
}
