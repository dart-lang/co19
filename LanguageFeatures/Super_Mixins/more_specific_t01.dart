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
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

class I {}
class J {}

class B {
  int get b1 => 3;
}
class C {
  int get b1 => 4;
}

mixin M on B, C implements I, J {}

class MA with M {
  int get b1 => 6;
}

main() {
  MA ma = new MA();
  Expect.isTrue(ma.b1 is int);
}
