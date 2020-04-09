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
 *  SHORT[EXP(e1), fn[x] => x.f = EXP(e2)]. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

void testShort(A? x, String e2) {
  var actual1 = x?.text = e2;
  var n0 = x;
  var expected1 = n0 == null ? null : n0.text = e2;
  Expect.equals(expected1, actual1);

  var actual2 = x?.text3 = e2;
  var expected2 = n0 == null ? null : n0.text3 = e2;
  Expect.equals(expected2, actual2);
}

main() {
  A? a1 = null;
  testShort(a1, "Show must go on");
  a1 = new A();
  testShort(a1, "Show must go on");

  A a2 = new A();
  testShort(a2, "Show must go on");
}
