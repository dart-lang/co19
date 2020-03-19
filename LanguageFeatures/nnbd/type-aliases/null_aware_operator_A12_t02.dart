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
 * to: SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class C {
  List _list;
  void operator[]=(int index, dynamic value) => _list[index] = value;

  C(int length) :  _list = new List.filled(length, null);
}

typedef CAlias1 = C?;
typedef CAlias2 = C;

void testShort(C? x, int index, dynamic value) {
  var actual = x?[index] = value;
  var n0 = x;
  var expected = n0 == null ? null : n0[index] = value;
  Expect.equals(expected, actual);
}


main() {
  CAlias1 c1 = null;
  testShort(c1, 42, "Lily was here");
  c1 = new C(3);
  testShort(c1, 2, "Show must go on");

  CAlias1? c2 = null;
  testShort(c2, 42, "Lily was here");
  c2 = new C(3);
  testShort(c2, 2, "Show must go on");

  CAlias2? c3 = null;
  testShort(c3, 42, "Lily was here");
  c3 = new C(3);
  testShort(c3, 2, "Show must go on");

  CAlias2 c4 = new C(3);
  testShort(c4, 2, "Show must go on");
}