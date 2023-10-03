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
/// • im.isMethod evaluates to true iff m is a method.
///
/// @description Checks that `im.isMethod` evaluates to `true` iff `m` is a
/// method
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

bool log = false;

mixin class A {
  bool m();
  bool get g;
  void set s(bool i);

  dynamic noSuchMethod(Invocation i) {
    log = i.isMethod;
    return i.isMethod;
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
  Expect.isTrue(A().m());
  Expect.isFalse(A().g);
  A().s = true;
  Expect.isFalse(log);

  Expect.isTrue(C1().m());
  Expect.isFalse(C1().g);
  C1().s = true;
  Expect.isFalse(log);

  Expect.isTrue(C2().m());
  Expect.isFalse(C2().g);
  C2().s = true;
  Expect.isFalse(log);

  Expect.isTrue(MA().m());
  Expect.isFalse(MA().g);
  MA().s = true;
  Expect.isFalse(log);

  Expect.isTrue(E.e1.m());
  Expect.isFalse(E.e1.g);
  E.e1.s = true;
  Expect.isFalse(log);
}
