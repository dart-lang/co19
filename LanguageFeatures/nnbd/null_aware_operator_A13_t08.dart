/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1?[e2] = e3 translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]
 *
 *  The other assignment operators are handled equivalently.
 *
 * @description Check that assignments like e1?[e2] >>= e3 translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)] >>= EXP(e3)]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  List<int> _list = [3, 1, 4];
  int operator[](int index) => _list[index];
  void operator[]=(int index, dynamic value) => _list[index] = value;

  void init() {
    _list = [3, 1, 4];
  }
}

void testShort(C? x, int index, dynamic value) {
  var actual = x?[index] >>= value;
  var n0 = x;
  x?.init();
  var expected = n0 == null ? null : n0[index] >>= value;
  Expect.equals(expected, actual);
}

main() {
  C? c1 = null;
  testShort(c1, 0, 1);
  c1 = new C();
  testShort(c1, 0, 1);

  C c2 = new C();
  testShort(c2, 0, 1);
}
