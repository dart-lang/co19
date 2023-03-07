// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a mixin declaration like mixin A<X extends S, Y extends T>
/// on B, C implements D, E { body } the on clause declares the interfaces B and
/// C as super-class constraints of the mixin. Having a super-class constraint
/// allows the mixin declaration instance members to perform super-invocations
/// (like super.foo()) if they are allowed by a class implementing both B and C.
///
/// @description Checks that a mixin declaration can perform super-invocations.
/// Test operators and "mixin" implementation of "on" clause interfaces
/// @author ngl@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import "../../Utils/expect.dart";

class A {
  int va = 1;
  int operator +(A v1) {return v1.va + 10000;}
}

class B {
  int vb = 2;
  int operator -() => vb + 20000;
}

class C = B with A;

mixin M on A, B {
  int va = 10;
  int vb = 20;
  int operator +(A v1) => v1.va + 100000;
  int operator -() => vb + 200000;

  testM() {
    Expect.equals(10001, super + new A());
    Expect.equals(10100, super + this);
    Expect.equals(20200, -super);
  }
}

class MA extends C with M {
  int va = 100;
  int vb = 200;
  int operator +(A v1) => v1.va + 1000000;
  int operator -() => vb + 2000000;

  testMA() {
    Expect.equals(100001, super + new A());
    Expect.equals(100100, super + this);
    Expect.equals(200200, -super);
  }
}

main() {
  MA ma = new MA();
  Expect.equals(1000100, ma + ma);
  Expect.equals(2000200, -ma);

  ma.testM();
  ma.testMA();
}
