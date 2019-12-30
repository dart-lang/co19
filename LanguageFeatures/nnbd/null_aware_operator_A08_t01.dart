/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The assignment e1?.f = e2 translates to:
 *  SHORT[EXP(e1), fn[x] => x.f = EXP(e2)]
 *
 * @description Check that the assignment e1?.f = e2 translates to:
 *  SHORT[EXP(e1), fn[x] => x.f = EXP(e2)]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  String test1 = "Lily was here";
  void set test2(String v) {
    this.test1 = v;
  }
}

void testShort(C? x, String e2) {
  var actual1 = x?.test1 = e2;
  var n0 = x;
  var expected1 = n0 == null ? null : n0.test1 = e2;
  Expect.equals(expected1, actual1);

  var actual2 = x?.test2 = e2;
  var expected2 = n0 == null ? null : n0.test2 = e2;
  Expect.equals(expected2, actual2);
}

main() {
  C? c1 = null;
  testShort(c1, "Show must go on");
  c1 = new C();
  testShort(c1, "Show must go on");

  C c2 = new C();
  testShort(c2, "Show must go on");
}
