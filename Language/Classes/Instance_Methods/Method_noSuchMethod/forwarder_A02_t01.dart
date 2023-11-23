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
/// implicitly induced for each member signature which is `noSuchMethod`
/// forwarded. Test the case when forwarding is requested in program and `C` has
/// a concrete member named `m` but it doesn't have a required signature
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

abstract mixin class A {
  String m([String s]);
}

class B {
  String m() => "B";
}

class C1 extends A implements B {
  dynamic noSuchMethod(Invocation i) => "C1";
}

class C2 with A implements B {
  dynamic noSuchMethod(Invocation i) => "C2";
}

mixin M on A implements B {
  dynamic noSuchMethod(Invocation i) => "M";
}

class MA = A with M;

enum E with A implements B {
  e1,
  e2;

  noSuchMethod(Invocation i) => "E";
}

main() {
  Expect.equals("C1", C1().m());
  Expect.equals("C1", C1().m(""));
  Expect.equals("C2", C2().m());
  Expect.equals("C2", C2().m(""));
  Expect.equals("M", MA().m());
  Expect.equals("M", MA().m(""));
  Expect.equals("E", E.e1.m());
  Expect.equals("E", E.e1.m(""));
}
