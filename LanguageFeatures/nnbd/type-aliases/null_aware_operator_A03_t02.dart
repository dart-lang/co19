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
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class C {
  String test1() => "Lily was here";
  String test2(String arg) => arg;
}

typedef CAlias1 = C?;
typedef CAlias2 = C;

void testShort(C? x) {
  var actual1 = x?.test1();
  var n1 = x;
  var expected1 = n1 == null ? null : n1.test1();
  Expect.equals(expected1, actual1);

  var actual2 = x?.test2("Show must go on");
  var n2 = x;
  var expected2 = n2 == null ? null : n2.test2("Show must go on");
  Expect.equals(expected2, actual2);
}

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
