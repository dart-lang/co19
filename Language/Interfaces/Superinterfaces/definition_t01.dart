/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface has a set of direct superinterfaces.
 * An interface J is a superinterface of an interface I iff either J is a
 * direct superinterface of I or J is a superinterface of a direct
 * superinterface of I.
 * @description Checks that an interface can declare generic and non-generic
 * direct superinterfaces or not declare any.
 * @author vasya
 */

abstract class J {}
abstract class I implements J {}

abstract class J1 {}
abstract class J2 implements J1 {}
abstract class J3 implements J2 {}
abstract class I1 implements J1, J2, J3 {}
abstract class I2 implements J3, J2, J1 {}

abstract class K<S> {}
abstract class L<S> implements K<S> {}

abstract class A<S, T> {}
abstract class B<S, T> implements A<T, S> {}
abstract class C<Q, R, S> implements A<Q, S> {}
abstract class D<Q> implements A<int, Q>, J, I {}

main() {
  I i = null;
  I1 i1 = null;
  I2 i2 = null;
  B<String, int> b = null;
  C<List, String, num> c = null;
  D<String> d = null;
}
