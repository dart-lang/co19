/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1.f = e2 translates to:
 *  PASSTHRU[F, fn[x] => x.f = EXP(e2)]
 *
 *  The other assignment operators are handled equivalently.
 *
 * @description Check that assignments like e1.f *= e2 translates to:
 *  PASSTHRU[F, fn[x] => x.f *= EXP(e2)]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  int test = 2;
}

main() {
  C? c1 = new C();
  if (c1 != null) {
    Expect.equals(84, c1.test *= 42);
  }

  C c2 = new C();
  Expect.equals(84, c2.test *= 42);
}
