// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Effectively, each super parameters, super.p:
/// ...
/// Implicitly adds that variable as an implicit argument to the
/// super-constructor invocation.
///
/// @description Check that super parameter is implicitly added to
/// super-constructor invocation
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S {
  int s1, s2;
  String log;
  S(int x, [int p = 0]) : s1 = x, s2 = p, log = "S";
  S.n(int x, [int p = 0]) : s1 = x, s2 = p, log = "S.n";
}

class C extends S {
  int c;
  C(this.c, super.x, int y);
  C.n(this.c, super.x, int y, super.p) : super.n();
}

main() {
  var c1 = C(1, 2, 3);
  Expect.equals("S", c1.log);
  Expect.equals(2, c1.s1);
  Expect.equals(0, c1.s2);

  var c2 = C.n(1, 2, 3, 4);
  Expect.equals("S.n", c2.log);
  Expect.equals(2, c2.s1);
  Expect.equals(4, c2.s2);
}
