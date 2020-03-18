/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1[e2] = e3 translates to:
 *  PASSTHRU[F, fn[x] => x[EXP(e2)] = EXP(e3)]
 *
 * @description Check that if e1 translates to F then e1[e2] = e3 translates to:
 *  PASSTHRU[F, fn[x] => x[EXP(e2)] = EXP(e3)]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class C {
  List<int> _list = [3, 1, 4];
  int operator[](int index) => _list[index];
  void operator[]=(int index, dynamic value) => _list[index] = value;
}

typedef CAlias1 = C?;
typedef CAlias2 = C;

main() {
  CAlias1 c1 = new C();
  if (c1 != null) {
    Expect.equals(42, c1[0] = 42);
  }

  CAlias1? c2 = new C();
  if (c2 != null) {
    Expect.equals(42, c2[0] = 42);
  }

  CAlias2? c3 = new C();
  if (c3 != null) {
    Expect.equals(42, c3[0] = 42);
  }

  CAlias2 c4 = new C();
  Expect.equals(42, c4[0] = 42);
}
