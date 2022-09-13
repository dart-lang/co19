// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the type system, each record has a corresponding record type.
/// A record type looks similar to a function type's parameter list. The type is
/// surrounded by parentheses and may contain comma-separated positional fields:
///
/// (int, String name, bool) triple;
/// Each field is a type annotation and an optional name which isn't meaningful
/// but is useful for documentation purposes.
///
/// Named fields go inside a brace-delimited section of type and name pairs:
///
/// ({int n, String s}) pair;
/// A record type may have both positional and named fields:
///
/// (bool, num, {int n, String s}) quad;
///
/// @description Checks records type annotations in classes and mixins
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

class C {
  (int, String name) r1;
  ({num n, String s}) r2;
  (bool,{double d}) r3;

  C(this.r1, ({int n, String s}) this.r2, (bool,{double d}) this.r3);
  C.n((int, String name) a, ({num n, String s}) b, (bool,{double d}) c):
    r1 = a, r2 = b, r3 = c;
  (int, String name) m() => r1;
  ({num n, String s}) get g => r2;
  void set s((bool, {double d}) v) {
    r3 = v;
  }
}

mixin M on C {
  (int, String name) m1() => super.r1;
  ({num n, String s}) get g1 => super.r2;
  void set s1((bool, {double d}) v) {
    super.r3 = v;
  }
}

class CM = C with M;

main() {
  C c1 = C((42, "r1"), (n: 0, s: "r2"), (true, d: 3.14));
  Expect.equals((42, "r1"), c1.m());
  Expect.equals((n: 0, s: "r2"), c1.g);
  Expect.equals((true, d: 3.14), c1.r3);
  c1.s = (false, d: 1.1);
  Expect.equals((false, d: 1.1), c1.r3);

  C c2 = C.n((42, "r1"), (n: 3.14, s: "r2"), (true, d: 3.14));
  Expect.equals((42, "r1"), c2.m());
  Expect.equals((n: 3.14, s: "r2"), c2.g);
  Expect.equals((true, d: 3.14), c2.r3);
  c2.s = (false, d: 1.1);
  Expect.equals((false, d: 1.1), c2.r3);

  CM cm = CM((42, "r1"), (n: 0, s: "r2"), (true, d: 3.14));
  Expect.equals((42, "r1"), cm.m1());
  Expect.equals((n: 0, s: "r2"), cm.g1);
  Expect.equals((true, d: 3.14), cm.r3);
  cm.s1 = (false, d: 1.1);
  Expect.equals((false, d: 1.1), cm.r3);
}
