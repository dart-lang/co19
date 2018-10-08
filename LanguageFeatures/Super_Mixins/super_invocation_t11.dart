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
 * Test property and "implements" implementation of "on" clause interfaces
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

String console;

class A {
  String a = "A.a";
}

class B {
  String b = "B.b";
}

class C implements A, B {
  String a = "C.a";
  String b = "C.b";
}

mixin M on A, B {
  String a = "M.a";
  String b = "M.b";

  testM() {
    Expect.equals("C.a", super.a);
    Expect.equals("C.b", super.b);
  }
}

class MA extends C with M {
  String a = "MA.a";
  String b = "MA.b";

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
