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
 * @description Checks that it is a compile error to apply a mixin to a class
 * that doesn't implement all the 'on' type requirements of the mixin
 * declaration.
 * @compile-error
 * @author ngl@unipro.ru
 */

class I {}

class J {}

abstract class B<X extends num, Y extends num> {
  X get gi;
  set si(X p);
  X f();
}

abstract class C<X extends num, Y extends num> {
  Y get gj;
  set sj(Y p);
  Y g();
}

mixin M<X, Y> on B, C implements I, J {}

class MA1<X, Y> with M {}   //# 01: compile-time error

class MA2<X, Y> with M {    //# 02: compile-time error
  num i = 1;
  num get gi => i;
  set si(num p) => i = p;
  num f() => i;
}

class MA3<X, Y> with M {    //# 03: compile-time error
  num j = 2;
  num get gj => j;
  set sj(num p) => j = p;
  num g() => j;
}

class MA4<X, Y> with M {    //# 04: compile-time error
  num i = 1;
  num j = 2;
  set si(num p) => i = p;
  num f() => i;
  num get gj => j;
  set sj(num p) => j = p;
  num g() => j;
}

class MA5<X, Y> with M {    //# 05: compile-time error
  num i = 1;
  num j = 2;
  num get gi => i;
  num f() => i;
  num get gj => j;
  set sj(num p) => j = p;
  num g() => j;
}

class MA6<X, Y> with M {    //# 06: compile-time error
  num i = 1;
  num j = 2;
  num get gi => i;
  set si(num p) => i = p;
  num get gj => j;
  set sj(num p) => j = p;
  num g() => j;
}

class MA7<X, Y> with M {    //# 07: compile-time error
  num i = 1;
  num j = 2;
  num get gi => i;
  set si(num p) => i = p;
  num f() => i;
  set sj(num p) => j = p;
  num g() => j;
}

class MA8<X, Y> with M {    //# 08: compile-time error
  num i = 1;
  num j = 2;
  num get gi => i;
  set si(num p) => i = p;
  num f() => i;
  num get gj => j;
  num g() => j;
}

class MA9<X, Y> with M {    //# 09: compile-time error
  num i = 1;
  num j = 2;
  num get gi => i;
  set si(num p) => i = p;
  num f() => i;
  num get gj => j;
  set sj(num p) => j = p;
}

main() {
}
