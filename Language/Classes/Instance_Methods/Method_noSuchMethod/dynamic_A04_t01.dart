// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the dynamic semantics, assume that a class C has an
/// implicitly induced noSuchMethod forwarder named m, with formal type
/// parameters X1, . . . , Xr, positional formal parameters a1, . . . , ak (some
/// of which may be optional when n = 0), and named formal parameters with names
/// x1, . . . , xn
///
/// The execution of the body of m creates an instance im of the predefined im
/// class Invocation such that:
/// ...
/// • im.memberName evaluates to the symbol m.
///
/// @description Checks that `im.memberName` evaluates to the symbol `m`.
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

late Symbol log;

mixin class A {
  Symbol m();
  Symbol get g;
  void set s(String s);

  dynamic noSuchMethod(Invocation i) {
    log = i.memberName;
    return i.memberName;
  }
}

class C1 extends A {}

class C2 with A {}

mixin M on A {}

class MA = A with M;

enum E with A {
  e1, e2;
}

main() {
  Expect.equals(#m, A().m());
  Expect.equals(#g, A().g);
  A().s = "";
  Expect.equals(Symbol("s="), log);

  Expect.equals(#m, C1().m());
  Expect.equals(#g, C1().g);
  C1().s = "";
  Expect.equals(Symbol("s="), log);

  Expect.equals(#m, C2().m());
  Expect.equals(#g, C2().g);
  C2().s = "";
  Expect.equals(Symbol("s="), log);

  Expect.equals(#m, MA().m());
  Expect.equals(#g, MA().g);
  MA().s = "";
  Expect.equals(Symbol("s="), log);

  Expect.equals(#m, E.e1.m());
  Expect.equals(#g, E.e2.g);
  E.e1.s = "";
  Expect.equals(Symbol("s="), log);
}
