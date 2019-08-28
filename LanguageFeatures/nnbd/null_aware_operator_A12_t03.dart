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
 * to: SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class A {
  List _list;
  dynamic operator[](int index) => _list[index];

  A(int length) {
    _list = new List(length);
  }
}

typedef AAlias1 = A?;
typedef AAlias2 = A;

main() {
  AAlias1 a1 = null;
  Expect.isNull(a1?.[42] = 13);
  Expect.isNull(a1);
  a1 = new A(3);
  Expect.equals(42, a1?.[0] = 42);
  Expect.equals(42, a1[0]);

  AAlias2 a2 = new A(3);
  Expect.equals(42, a2?.[0] = 42);   /// static type warning
  Expect.equals(42, a2[0]);
}
