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
 * Test operators and "implements" implementation of "on" clause interfaces
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

abstract class A {
  int va = 1;
  int operator + (A v1);
}

abstract class B {
  int operator -();
}

class C implements A, B {
  int va = 10;
  int vb = 20;
  int operator +(A v1) {return v1.va + 10000;}
  int operator -() => vb + 20000;
}

mixin M on A, B {
  int va = 100;
  int vb = 200;
  int operator +(A v1) {return v1.va + 100000;}
  int operator -() => vb + 200000;

  testM() {
    Expect.equals(10010, super + new C());
    Expect.equals(11000, super + this);
    Expect.equals(22000, -super);
  }
}

class MA extends C with M {
  int va = 1000;
  int vb = 2000;
  int operator +(A v1) {return v1.va + 1000000;}
  int operator -() => vb + 2000000;

  testMA() {
    Expect.equals(100010, super + new C());
    Expect.equals(101000, super + this);
    Expect.equals(202000, -super);
  }
}

main() {
  MA ma = new MA();
  Expect.equals(1001000, ma + ma);
  Expect.equals(2002000, -ma);

  ma.testM();
  ma.testMA();
}
