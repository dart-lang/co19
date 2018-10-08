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
 * Test getters and "extends" implementation of "on" clause interfaces
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {
  String get a => "A.a";
}

class B extends A {
  String get b => "B.b";
}

class C extends B {}

mixin M on A, B {
  String get a => "M.a";
  String get b => "M.b";

  testM() {
    Expect.equals("A.a", super.a);
    Expect.equals("B.b", super.b);
  }
}

class MA extends C with M {
  String get a => "MA.a";
  String get b => "MA.b";

  testMA() {
    Expect.equals("M.a", super.a);
    Expect.equals("M.b", super.b);
  }
}

main() {
  MA ma = new MA();
  Expect.equals("MA.a", ma.a);
  Expect.equals("MA.b", ma.b);

  ma.testM();
  ma.testMA();
}
