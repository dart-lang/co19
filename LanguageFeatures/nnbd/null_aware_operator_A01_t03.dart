/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A property access e?.f translates to:
 *  SHORT[EXP(e), fn[x] => x.f]
 *
 * @description Check that a property access e?.f translates to:
 *  SHORT[EXP(e), fn[x] => x.f]. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

void testShort(A? x) {
  var actual = x?.text;
  var n0 = x;
  var expected = n0 == null ? null : n0.text;
  Expect.equals(expected, actual);

  var actual2 = x?.text2;
  var expected2 = n0 == null ? null : n0.text2;
  Expect.equals(expected2, actual2);
}

main() {
  A? a1 = null;
  testShort(a1);
  a1 = new A();
  testShort(a1);

  A a2 = new A();
  testShort(a2);
}
