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
 * Test operators and "mixin" implementation of "on" clause interfaces
 * @issue 35090
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

String console = "";

class A {
  String get g => "g";
}

class C implements A {
  noSuchMethod(Invocation i) {
    console = "C";
  }
}

mixin M on A {
  test() {
    super.g;
  }

  noSuchMethod(Invocation i) {
    console = "M";
  }
}

class MA extends C with M {
}

main() {
  new MA().g;
  Expect.equals("M", console);
  new MA().test();
  Expect.equals("M", console);
}
