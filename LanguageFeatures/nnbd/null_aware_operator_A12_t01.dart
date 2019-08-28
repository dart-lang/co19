/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1?.[e2] = e3 translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]
 *
 * @description Check that if e1 translates to F then e1?.[e2] = e3 translates
 * to: SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {
  List _list;
  dynamic operator[](int index) => _list[index];

  A(int length) {
    _list = new List(length);
  }
}

main() {
  A? a = null;
  Expect.isNull(a?.[42] = 13);
  Expect.isNull(a);
  a = new A(3);
  Expect.equals(42, a?.[0] = 42);
  Expect.equals(42, a1[0]);

  List<String>? list = null;
  Expect.isNull(list?.[42] = 42);
  list = ["Lily", "was", "here"];
  Expect.equals("Leeloo", list?.[0] = "Leeloo");
  Expect.equals("Leeloo", list[0]);
}
