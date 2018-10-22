/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If more than one super-constraint interface declares a member
 * with  the same name, at least one of those members is more specific than the
 * rest,  and this is the unique signature that super-invocations are allowed
 * to invoke.
 *
 * @description Checks that if more than one super-constraint interface declares
 * a member with the same name, at least one of those members is more specific
 * than the rest, and this is the unique signature that super-invocations are
 * allowed to invoke.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class I {}
class J {}

class B {
  num get b1 => 2;
}
class C {
  double get b1 => 3.14;
}

bool called = false;

mixin M on B, C implements I, J {
  test() {
    called = true;
    Expect.equals(-3.14, super.b1);
  }
}

class A implements B, C {
  double get b1 => -3.14;
}

class MA extends A with M {
}

main() {
  MA ma = new MA();
  ma.test();
  Expect.isTrue(called);
}
