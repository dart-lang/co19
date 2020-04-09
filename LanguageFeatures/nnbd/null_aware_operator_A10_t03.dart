/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1.f = e2 translates to:
 *  PASSTHRU[F, fn[x] => x.f = EXP(e2)]
 *
 * @description Check that If e1 translates to F then e1.f = e2 translates to:
 *  PASSTHRU[F, fn[x] => x.f = EXP(e2)]. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  A? a1 = new A();
  if (a1 != null) {
    Expect.equals("Show must go on", a1.text = "Show must go on");
    Expect.equals("No woman no cry", a1.text3 = "No woman no cry");
  }

  A a2 = new A();
  Expect.equals("Show must go on", a2.text = "Show must go on");
  Expect.equals("No woman no cry", a2.text3 = "No woman no cry");
}
