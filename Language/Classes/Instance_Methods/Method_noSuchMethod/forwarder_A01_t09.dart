// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a concrete class, let L be the library that contains the
/// declaration of C, and let m be a name. Then m is noSuchMethod forwarded in C
/// iff one of the following is true:
///
/// • Requested in program: C has a non-trivial noSuchMethod, the interface of C
/// contains a member signature S named m, and C has no concrete member named m
/// and accessible to L that correctly overrides S (that is, no member named m
/// is declared or inherited by C, or one is inherited, but it does not have the
/// required signature). In this case we also say that S is noSuchMethod
/// forwarded.
///
/// • Forced by privacy: There exists a direct or indirect superinterface D of C
/// which is declared in a library L2 different from L, the interface of D
/// contains a member signature S named m, m is a private name, and no
/// superclass of C has a concrete member named m accessible to L2 that
/// correctly overrides S. In this case we also say that S is noSuchMethod
/// forwarded.
///
/// For a concrete class C, a noSuchMethod forwarder is implicitly induced for
/// each member signature which is noSuchMethod forwarded.
///
/// @description Checks that for a concrete class, a `noSuchMethod` forwarder is
/// invoked if `C` has no concrete member named `m`. Expect run-time error if a
/// forwarder of a setter is called with a wrong type.
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

String log = "";

abstract mixin class A {
  void set a(String s);
}

class C1 {
  void set m(String s);
  noSuchMethod(Invocation i) {
    log = "C1";
  }
}

class C2 extends A {
  dynamic noSuchMethod(Invocation i) {
    log = "C2";
  }
}

class C3 implements A {
  dynamic noSuchMethod(Invocation i) {
    log = "C3";
  }
}

class C4 with A {
  dynamic noSuchMethod(Invocation i) {
    log = "C4";
  }
}

mixin M1 {
  void set m(String s);
  noSuchMethod(Invocation i) {
    log = "M1";
  }
}

mixin M2 on A {
  dynamic noSuchMethod(Invocation i) {
    log = "M2";
  }
}

mixin M3 implements A {
  dynamic noSuchMethod(Invocation i) {
    log = "M3";
  }
}

class MA1 = Object with M1;
class MA2 = A with M2;
class MA3 = A with M3;

enum E1 {
  e1,
  e2;

  void set m(String s);
  noSuchMethod(Invocation i) {
    log = "E1";
  }
}

enum E2 implements A {
  e1,
  e2;

  dynamic noSuchMethod(Invocation i) {
    log = "E2";
  }
}

enum E3 with A {
  e1,
  e2;

  dynamic noSuchMethod(Invocation i) {
    log = "E3";
  }
}

main() {
  Expect.throws(() {C1().m = 1 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {C2().a = 2 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {C3().a = 3 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {C4().a = 4 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {MA1().m = 11 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {MA2().a = 12 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {MA3().a = 13 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {E1.e1.m = 21 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {E2.e2.a = 22 as dynamic;});
  Expect.equals("", log);
  Expect.throws(() {E3.e1.a = 23 as dynamic;});
  Expect.equals("", log);
}
