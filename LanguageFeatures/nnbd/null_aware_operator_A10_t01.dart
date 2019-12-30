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
 *  PASSTHRU[F, fn[x] => x.f = EXP(e2)]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  String test1 = "Lily was here";
  void set test2(String v) {
    this.test1 = v;
  }
}

main() {
  C? c1 = new C();
  if (c1 != null) {
    Expect.equals("Show must go on", c1.test1 = "Show must go on");
    Expect.equals("No woman no cry", c1.test2 = "No woman no cry");
  }

  C c2 = new C();
  Expect.equals("Show must go on", c2.test1 = "Show must go on");
  Expect.equals("No woman no cry", c2.test2 = "No woman no cry");
}
