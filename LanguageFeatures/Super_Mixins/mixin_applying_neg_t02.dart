/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin introduced by A can then only be applied to classes that
 * implement both B and C.
 *
 * @description Checks that mixin declaration can only be applied to classes
 * that implement both B and C.
 * @compile-error
 * @author ngl@unipro.ru
 */

abstract class I {
  int get gi1;
}
abstract class J {
  int get gj1;
}

abstract class B {
  int get gb1;
}
abstract class C {
  int get gc1;
}

mixin M on B, C implements I, J {}

class MA1 with M {  //# 01: compile-time error
  int get gc1 => 2;
  int get gi1 => 3;
  int get gj1 => 4;
}

class MA2 with M {  //# 02: compile-time error
  int get gb1 => 1;
  int get gi1 => 3;
  int get gj1 => 4;
}


main() {
}
