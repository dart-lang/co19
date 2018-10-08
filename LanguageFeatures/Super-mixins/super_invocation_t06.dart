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
 * Test getters and "mixin" implementation of "on" clause interfaces
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {
  String a1() => "A.a1";
  String a2() {
    return "A.a2";
  }
  String a3(String arg) {
    return "A.a3:$arg";
  }
  String _a4() => "A._a4";
}

class B extends A {
  String b1() => "B.b1";
  String b2() {
    return "B.b2";
  }
  String b3(String arg) {
    return "B.b3:$arg";
  }
}

class C = B with A;

mixin M on A, B {
  String a1() => "M.a1";
  String a2() {
    return "M.a2";
  }
  String a3(String arg) {
    return "M.a3:$arg";
  }
  String b1() => "M.b1";
  String b2() {
    return "M.b2";
  }
  String b3(String arg) {
    return "M.b3:$arg";
  }

  testM() {
    Expect.equals("A.a1", super.a1());
    Expect.equals("A.a2", super.a2());
    Expect.equals("A.a3:M", super.a3("M"));
    Expect.equals("A._a4", super._a4());
    Expect.equals("B.b1", super.b1());
    Expect.equals("B.b2", super.b2());
    Expect.equals("B.b3:M", super.b3("M"));
  }
}

class MA extends C with M {
  String a1() => "MA.a1";
  String a2() {
    return "MA.a2";
  }
  String a3(String arg) {
    return "MA.a3:$arg";
  }
  String b1() => "MA.b1";
  String b2() {
    return "MA.b2";
  }
  String b3(String arg) {
    return "MA.b3:$arg";
  }

  testMA() {
    Expect.equals("M.a1", super.a1());
    Expect.equals("M.a2", super.a2());
    Expect.equals("M.a3:MA", super.a3("MA"));
    Expect.equals("M.b1", super.b1());
    Expect.equals("M.b2", super.b2());
    Expect.equals("M.b3:MA", super.b3("MA"));
  }
}

main() {
  MA ma = new MA();
  Expect.equals("MA.a1", ma.a1());
  Expect.equals("MA.a2", ma.a2());
  Expect.equals("MA.a3:X", ma.a3("X"));
  Expect.equals("MA.b1", ma.b1());
  Expect.equals("MA.b2", ma.b2());
  Expect.equals("MA.b3:X", ma.b3("X"));

  ma.testM();
  ma.testMA();
}
