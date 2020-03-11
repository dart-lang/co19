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
 * Test e?.m()?.n()
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  String? test1() => "Lily was here";
  String? test2(String? arg) => arg;
}

void testShort(C? x) {
  var actual1 = x?.test1()?.substring(0, 4);
  var n1 = x;
  var expected1 = null;
  if (n1 != null) {
    var t1 = n1.test1();
    if (t1 != null) {
      expected1 = t1.substring(0, 4);
    }
  }
  Expect.equals(expected1, actual1);

  var actual2 = x?.test2("Show must go on")?.substring(0, 4);
  var n2 = x;
  var expected2 = null;
  if (n2 != null) {
    var t2 = n2.test2("Show must go on");
    if (t2 != null) {
      expected2 = t2.substring(0, 4);
    }
  }
  Expect.equals(expected2, actual2);

  var actual3 = x?.test2(null)?.substring(0, 4);
  var n3 = x;
  var expected3 = null;
  if (n3 != null) {
    var t3 = n3.test2(null);
    if (t3 != null) {
      expected2 = t3.substring(0, 4);
    }
  }
  Expect.equals(expected3, actual3);
}

main() {
  C? c1 = null;
  testShort(c1);
  c1 = new C();
  testShort(c1);

  C c2 = new C();
  testShort(c2);
}
