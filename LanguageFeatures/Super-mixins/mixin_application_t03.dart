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

abstract class B<X extends num> {
  X get gi;
  set si(X p);
  X f();
}

abstract class C<Y extends num> {
  Y get gj;
  set sj(Y p);
  Y g();
}

mixin M<X, Y> on B, C implements I, J {
  int f1();
}

class MA<X, Y> with M {
  num i = 1;
  num j = 2;
  num get gi => i;
  set si(num p) => i = p;
  num f() => 11;
  num get gj => j;
  set sj(num p) => j = p;
  num g() => 12;
  int f1() => 3;
}

main() {
  new MA<int, int>();
}
