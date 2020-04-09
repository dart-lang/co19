/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1?[e2] = e3 translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]
 *
 * @description Check that if e1 translates to F then e1?[e2] = e3 translates
 * to: SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

void testShort(A? x, int index, dynamic value) {
  var actual = x?[index] = value;
  var n0 = x;
  var expected = n0 == null ? null : n0[index] = value;
  Expect.equals(expected, actual);
}

main() {
  A? a1 = null;
  testShort(a1, 42, "Lily was here");
  a1 = new A();
  testShort(a1, 42, "Show must go on");

  A a2 = new A();
  testShort(a2, 42, "Show must go on");
}
