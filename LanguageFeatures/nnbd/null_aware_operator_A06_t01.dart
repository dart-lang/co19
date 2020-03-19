/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1?[e2] translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)]]
 *
 * @description Check that if e1 translates to F then e1?[e2] translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)]]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  int operator[](int index) => index;
}

void testShort(C? x) {
  var actual1 = x?[42];
  var n0 = x;
  var expected1 = n0 == null ? null : n0[42];
  Expect.equals(expected1, actual1);
}

main() {
  C? c1 = null;
  testShort(c1);
  c1 = new C();
  testShort(c1);

  C c2 = new C();
  testShort(c2);
}
