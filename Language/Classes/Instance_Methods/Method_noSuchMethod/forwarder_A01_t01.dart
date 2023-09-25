// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a concrete class, let L be the library that contains the
/// declaration C, L, m of C, and let m be a name. Then m is noSuchMethod
/// forwarded in C iff one of the following is true:
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
/// implicitly induced for each member signature which is `noSuchMethod`
/// forwarded. Test the case when forwarding is requested in program
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

abstract mixin class A {
  String a();
}

class C1 {
  String m();
  noSuchMethod(Invocation i) => "C1";
}

class C2 extends A {
  dynamic noSuchMethod(Invocation i) => "C2";
}

class C3 implements A {
  dynamic noSuchMethod(Invocation i) => "C3";
}

class C4 with A {
  dynamic noSuchMethod(Invocation i) => "C4";
}

mixin M1 {
  String m();
  noSuchMethod(Invocation i) => "M1";
}

mixin M2 on A {
  dynamic noSuchMethod(Invocation i) => "M2";
}

mixin M3 implements A {
  dynamic noSuchMethod(Invocation i) => "M3";
}

class MA1 = Object with M1;
class MA2 = A with M2;
class MA3 = A with M3;

enum E1 {
  e1,
  e2;

  String m();
  noSuchMethod(Invocation i) => "E1";
}

enum E2 implements A {
  e1,
  e2;

  dynamic noSuchMethod(Invocation i) => "E2";
}

enum E3 with A {
  e1,
  e2;

  dynamic noSuchMethod(Invocation i) => "E3";
}

main() {
  Expect.equals("C1", C1().m());
  Expect.equals("C2", C2().a());
  Expect.equals("C3", C3().a());
  Expect.equals("C4", C4().a());
  Expect.equals("M1", MA1().m());
  Expect.equals("M2", MA2().a());
  Expect.equals("M3", MA3().a());
  Expect.equals("E1", E1.e1.m());
  Expect.equals("E2", E2.e1.a());
  Expect.equals("E3", E3.e1.a());
}
