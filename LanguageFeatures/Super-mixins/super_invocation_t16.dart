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
 * Test operators and "extends" implementation of "on" clause interfaces
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

class A {
  int va = 1;
  int operator +(A v1) {return v1.va + 1000;}
}

class B extends A {
  int vb = 2;
  int operator -() => vb + 2000;
}

class C extends B {
}

mixin M on A, B {
  int va = 10;
  int vb = 20;
  int operator +(A v1) => v1.va + 10000;
  int operator -() => vb + 20000;

  testM() {
    Expect.equals(1001, super + new A());
    Expect.equals(1100, super + this);
    Expect.equals(2200, -super);
  }
}

class MA extends C with M {
  int va = 100;
  int vb = 200;
  int operator +(A v1) => v1.va + 100000;
  int operator -() => vb + 200000;

  testMA() {
    Expect.equals(10100, super + this);
    Expect.equals(10001, super + new A());
    Expect.equals(20200, -super);
  }

}

main() {
  MA ma = new MA();
  Expect.equals(100100, ma + ma);
  Expect.equals(200200, -ma);

  ma.testM();
  ma.testMA();
}
