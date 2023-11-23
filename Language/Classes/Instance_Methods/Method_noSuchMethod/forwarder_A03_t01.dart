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
/// @description Checks that 'noSuchMethod' forwarder forced by privacy always
/// throws
/// @author sgrekhov22@gmail.com

import "no_such_method_lib.dart";
import "../../../../Utils/expect.dart";

class C extends D0 {
  String _m(); // This _m is different from D0._m: They behave differently.
  dynamic noSuchMethod(Invocation i) => "C";
}

mixin M on D0 {
  String _m();
  dynamic noSuchMethod(Invocation i) => "M";
}

class MA = D0 with M;

enum E with D0 {
  e1, e2;
  String _m();
  dynamic noSuchMethod(Invocation i) => "E";
}

main() {
  Expect.equals("C", C()._m());
  Expect.throws(() {C().test();});
  D0 d1 = C();
  Expect.throws(() {d1.test();});

  Expect.equals("M", MA()._m());
  Expect.throws(() {MA().test();});
  D0 d2 = MA();
  Expect.throws(() {d2.test();});

  Expect.equals("E", E.e1._m());
  Expect.throws(() {E.e1.test();});
  D0 d3 = E.e1;
  Expect.throws(() {d3.test();});
}
