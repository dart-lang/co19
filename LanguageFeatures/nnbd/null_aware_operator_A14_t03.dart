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
 *  PASSTHRU[F, fn[x] => x[EXP(e2)] = EXP(e3)]. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  A? a1 = new A();
  if (a1 != null) {
    Expect.equals(42, a1[13] = 42);
  }

  A a2 = new A();
  Expect.equals(42, a2[13] = 42);
}
