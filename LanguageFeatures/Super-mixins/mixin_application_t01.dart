/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Mixin application semantics is mostly unchanged, except that it's
 * a compile-time error to apply a mixin to a class that doesn't implement all
 * the 'on' type requirements of the mixin declaration, or apply a mixin
 * containing super-invocations to a class that doesn't have a concrete
 * implementation of the super-invoked members compatible with the
 * super-constraint interface.
 *
 * @description Checks that it is not a compile error to apply a mixin to a
 * class that implements all the 'on' type requirements of the mixin
 * declaration.
 * @author ngl@unipro.ru
 */

class I {}
class J {}

abstract class B {
  int get gi;
  set si(int p);
  int f();
}
abstract class C {
  int get gj;
  set sj(int p);
  int g();
}

mixin M on B, C implements I, J {
  int f1();
}

class MA with M {
  int i = 1;
  int j = 2;
  int get gi => i;
  set si(int p) => i = p;
  int f() => 11;
  int get gj => j;
  set sj(int p) => j = p;
  int g() => 12;
  int f1() => 3;
}

main() {
  new MA();
}
