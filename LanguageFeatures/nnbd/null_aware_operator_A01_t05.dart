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
 *  SHORT[EXP(e), fn[x] => x.f]
 * Test e?.f?.g
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  String? test1 = "Lily was here";
  String? get test2 => test1;
}

void testShort(C? x) {
  var actual = x?.test1?.substring(0, 4);
  var n0 = x;
  var expected = null;
  if (n0 != null) {
    var t1 = n0.test1;
    if (t1 != null) {
      expected = t1.substring(0, 4);
    }
  }
  Expect.equals(expected, actual);

  var actual2 = x?.test2?.length;
  var expected2 = null;
  if (n0 != null) {
    var t2 = n0.test2;
    if (t2 != null) {
      expected2 = t2.length;
    }
  }
  Expect.equals(expected2, actual2);
}

main() {
  C? c1 = null;
  testShort(c1);
  c1 = new C();
  testShort(c1);
  if (c1 != null) {
    c1.test1 = null;
    testShort(c1);
  }

  C c2 = new C();
  testShort(c2);
  c2.test1 = null;
  testShort(c2);
}
