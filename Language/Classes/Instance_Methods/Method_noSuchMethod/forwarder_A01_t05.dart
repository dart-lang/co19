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
/// no concrete member named `m`
/// @author sgrekhov22@gmail.com

import "no_such_method_lib.dart";
import "../../../../Utils/expect.dart";

class C1 extends D1 {
  String _m();
}

class C2 extends D2 {
  String _m();
  dynamic noSuchMethod(Invocation i) => "C2";
}

mixin M1 on D1 {
  String _m();
}

mixin M2 on D2 {
  String _m();
  dynamic noSuchMethod(Invocation i) => "M2";
}

class MA1 = D1 with M1;
class MA2 = D2 with M2;

enum E1 with D1 {
  e1, e2;
  String _m();
}

enum E2 with D2 {
  e1, e2;
  String _m();
  dynamic noSuchMethod(Invocation i) => "E2";
}

main() {
  Expect.equals("D1", C1()._m());
  Expect.equals("C2", C2()._m());
  Expect.equals("D1", MA1()._m());
  Expect.equals("M2", MA2()._m());
  Expect.equals("D1", E1.e1._m());
  Expect.equals("E2", E2.e2._m());
}
