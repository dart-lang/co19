/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin introduced by a mixin declaration contains all the
 * non-static members declared by the mixin, just as the mixin derived from a
 * class declaration currently does.
 *
 * @description Checks that a mixin declaration doesn't contain the static
 * members declared by the mixin
 * @compile-error
 * @author ngl@unipro.ru
 * @author sgrekhov@unipro.ru
 */

class I {
  static int i1 = 1;
}

abstract class J {
  static int j1 = 2;
}


class A {
  static int b1 = 3;
}

abstract class B {
  static int b1 = 3;
}

class C implements A, B {
  static int c1 = 4;
}

mixin M on A, B implements I, J {
  static int m1 = 5;
}

class MA extends C with M {
  test() {
    i1 == 1; //# 01: compile-time error
    j1 == 2; //# 02: compile-time error
    b1 == 3; //# 03: compile-time error
    c1 == 4; //# 04: compile-time error
    m1 == 5; //# 05: compile-time error
  }
}

main() {
  MA ma = new MA();
  MA.i1 == 1; //# 06: compile-time error
  MA.j1 == 2; //# 07: compile-time error
  MA.b1 == 3; //# 08: compile-time error
  MA.c1 == 4; //# 09: compile-time error
  MA.m1 == 5; //# 10: compile-time error

  ma.test();
}
