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
 *  SHORT[EXP(e), fn[x] => x.f]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class C {
  String test1 = "Lily was here";
  String get test2 => "Show must go on";
}

void testShort(C? x) {
  var actual = x?.test1;
  var n0 = x;
  var expected = n0 == null ? null : n0.test1;
  Expect.equals(expected, actual);

  var actual2 = x?.test2;
  var expected2 = n0 == null ? null : n0.test2;
  Expect.equals(expected2, actual2);
}

typedef CAlias1 = C?;
typedef CAlias2 = C;

main() {
  CAlias1 c1 = null;
  testShort(c1);
  c1 = new C();
  testShort(c1);

  CAlias1? c2 = null;
  testShort(c2);
  c2 = new C();
  testShort(c2);

  CAlias2? c3 = null;
  testShort(c3);
  c3 = new C();
  testShort(c3);

  CAlias2 c4 = new C();
  testShort(c4);
}
