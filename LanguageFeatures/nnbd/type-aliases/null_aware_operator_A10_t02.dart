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
 *  PASSTHRU[F, fn[x] => x.f = EXP(e2)]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class C {
  String test1 = "Lily was here";
  void set test2(String v) {
    this.test1 = v;
  }
}

typedef CAlias1 = C?;
typedef CAlias2 = C;

main() {
  CAlias1 c1 = new C();
  if (c1 != null) {
    Expect.equals("Show must go on", c1.test1 = "Show must go on");
    Expect.equals("No woman no cry", c1.test2 = "No woman no cry");
  }

  CAlias1? c2 = new C();
  if (c2 != null) {
    Expect.equals("Show must go on", c2.test1 = "Show must go on");
    Expect.equals("No woman no cry", c2.test2 = "No woman no cry");
  }

  CAlias2? c3 = new C();
  if (c3 != null) {
    Expect.equals("Show must go on", c3.test1 = "Show must go on");
    Expect.equals("No woman no cry", c3.test2 = "No woman no cry");
  }

  CAlias2 c4 = new C();
  Expect.equals("Show must go on", c4.test1 = "Show must go on");
  Expect.equals("No woman no cry", c4.test2 = "No woman no cry");
}
