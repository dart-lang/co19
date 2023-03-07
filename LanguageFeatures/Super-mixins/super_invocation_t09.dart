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
/// Test setters and "mixin" implementation of "on" clause interfaces
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import "../../Utils/expect.dart";

String console = "";

class A {
  void set a1(String s) {
    console = "A:$s";
  }
}

class B {
  void set b1(String s) {
    console = "B:$s";
  }
}

class C = A with B;

mixin M on A, B {
  void set a1(String s) {
    console = "M:$s";
  }
  void set b1(String s) {
    console = "M:$s";
  }

  testM() {
    super.a1 = "a1";
    Expect.equals("A:a1", console);
    super.b1 = "b1";
    Expect.equals("B:b1", console);
  }
}

class MA extends C with M {
  void set a1(String s) {
    console = "MA:$s";
  }
  void set b1(String s) {
    console = "MA:$s";
  }

  testMA() {
    super.a1 = "a1";
    Expect.equals("M:a1", console);
    super.b1 = "b1";
    Expect.equals("M:b1", console);
  }
}

main() {
  MA ma = new MA();
  ma.a1 = "a1";
  Expect.equals("MA:a1", console);
  ma.b1 = "b1";
  Expect.equals("MA:b1", console);

  ma.testM();
  ma.testMA();
}
