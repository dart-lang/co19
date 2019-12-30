/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1[e2] translates to:
 *  PASSTHRU[F, fn[x] => x[EXP(e2)]]
 *
 * @description If e1 translates to F then e1[e2] translates to:
 *  PASSTHRU[F, fn[x] => x[EXP(e2)]]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  int operator[](int index) => index;
}

main() {
  C c1 = new C();
  Expect.equals(42, c1[42]);

  C? c2 = new C();
  if (c2 != null) {
    Expect.equals(42, c2[42]);
  }
}
