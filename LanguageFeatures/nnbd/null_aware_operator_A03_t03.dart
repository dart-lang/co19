/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A null aware method call e?.m(args) translates to:
 *  SHORT[EXP(e), fn[x] => x.m(ARGS(args))]
 *
 * @description Check that a null aware method call e?.m(args) translates to:
 *  SHORT[EXP(e), fn[x] => x.m(ARGS(args))]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

void testShort(A? x) {
  var actual = x?.test();
  var n0 = x;
  var expected = n0 == null ? null : n0.test();
  Expect.equals(expected, actual);
}

main() {
  A? a1 = null;
  testShort(a1);
  a1 = new A();
  testShort(a1);

  A a2 = new A();
  testShort(a2);
}
