/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a mixin declaration like mixin A<X extends S, Y extends T>
 * on B, C implements D, E { body } the on clause declares the interfaces B and
 * C as super-class constraints of the mixin. Having a super-class constraint
 * allows the mixin declaration instance members to perform super-invocations
 * (like super.foo()) if they are allowed by a class implementing both B and C.
 *
 * @description Checks that a mixin declaration can perform super-invocations.
 * Test "extends" implementation of "on" clause interfaces and type parameters
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

class A<T1> {
  T1 a(T1 t) => t;
}

class B<T1, T2> extends A<T1> {
  T2 b(T2 t) => t;
}

class C<T1, T2> extends B<T1, T2> {
  T1 a(T1 t) => null;
  T2 b(T2 t) => null;
}

mixin M<T1 extends S, T2 extends T>  on A<T1>, B<T1, T2> {
  testM(T1 t1, T2 t2) {
    Expect.isNull(super.a(t1));
    Expect.isNull(super.b(t2));
  }
}

class MA<T1 extends S, T2 extends T> extends C<T1, T2> with M<T1, T2> {
  testMA(T1 t1, T2 t2) {
    Expect.isNull(super.a(t1));
    Expect.isNull(super.b(t2));
  }
}

main() {
  MA<X, Y> ma = new MA<X, Y>();

  ma.testM(new X(), new Y());
  ma.testMA(new X(), new Y());
}
