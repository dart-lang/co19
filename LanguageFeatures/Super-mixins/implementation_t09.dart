/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a mixin declaration like
 * mixin A<X extends S, Y extends T> on B, C implements D, E { body }
 * the on clause declares the interfaces B and C as super-class constraints of
 * the mixin. Having a super-class constaint allows the mixin declaration
 * instance members to perform super-invocations (like super.foo()) if they are
 * allowed by a class implementing both B and C. The mixin introduced by A can
 * then only be applied to classes that implement both B and C.
 *
 * @description Checks that mixin declaration can only be applied to classes
 * that implement both B and C.Test type parameters
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

abstract class I {
  int get gi1;
}
abstract class J {
  int get gj1;
}

abstract class B<X extends S> {
  int get gb1;
  X x;
}
abstract class C<Y extends T> {
  int get gc1;
  Y y;
}

class A implements B<X>, C<Y> {
  int get gb1 => 1;
  int get gc1 => 2;
  X x = new X();
  Y y = new Y();
}

mixin M<X extends S, Y extends T> on B<X>, C<Y> implements I, J {
  int get gi1 => 3;
  int get gj1 => 4;
}

class MA extends A with M<X, Y> {
}

main() {
  MA ma = new MA();
  Expect.equals(1, ma.gb1);
  Expect.equals(2, ma.gc1);
  Expect.equals(3, ma.gi1);
  Expect.equals(4, ma.gj1);
  Expect.isTrue(ma.x is X);
  Expect.isTrue(ma.y is Y);
}
