/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class S is a superclass of a class C iff either:
 * - S is the superclass of C, or
 * - S is a superclass of a class S0 and S0 is a superclass of C.
 * @description Checks that the superclass-subclass relationship is transitive.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

main() {
  D d = new D();
  Expect.isTrue(d is B);
  Expect.isTrue(d is A);
  Expect.isTrue(d is Object);
}
