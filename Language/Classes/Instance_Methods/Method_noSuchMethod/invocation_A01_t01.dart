// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A noSuchMethod forwarder is a concrete member of C with the
/// signature taken from the interface of C, and with the same default value for
/// each optional parameter. It can be invoked in an ordinary invocation and in
/// a superinvocation, and when m is a method it can be closurized using a
/// property extraction.
///
/// @description Checks that `noSuchMethod` forwarder can be invoked in an
/// ordinary invocation and in a superinvocation
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

mixin class A {
  int m1(int v, [covariant String s = "s1"]);

  int m2(int v, {covariant String s = "s2"});

  dynamic noSuchMethod(Invocation inv) {
    return 42;
  }
}

class C1 extends A {
  test() {
    Expect.equals(42, super.m1(1, "1"));
    Expect.equals(42, super.m2(2, s: "2"));
    Expect.equals(42, this.m1(1, "1"));
    Expect.equals(42, this.m2(2, s: "2"));
  }
}

class C2 with A {
  test() {
    Expect.equals(42, this.m1(1, "1"));
    Expect.equals(42, this.m2(2, s: "2"));
  }
}

mixin M on A {
  test() {
    Expect.equals(42, super.m1(1, "1"));
    Expect.equals(42, super.m2(2, s: "2"));
    Expect.equals(42, this.m1(1, "1"));
    Expect.equals(42, this.m2(2, s: "2"));
  }
}

class MA = A with M;

enum E with A {
  e1, e2;
  test() {
    Expect.equals(42, this.m1(1, "1"));
    Expect.equals(42, this.m2(2, s: "2"));
  }
}

main() {
  Expect.equals(42, A().m1(1, "1"));
  Expect.equals(42, A().m2(2, s: "2"));
  C1().test();
  C2().test();
  Expect.equals(42, MA().m1(1, "1"));
  Expect.equals(42, MA().m2(2, s: "2"));
  MA().test();
  Expect.equals(42, E.e1.m1(1, "1"));
  Expect.equals(42, E.e1.m2(2, s: "2"));
  E.e1.test();
}
