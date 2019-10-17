/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e translates to F then e.f translates to:
 *  PASSTHRU[F, fn[x] => x.f]
 *
 * @description Check that if e translates to F then e.f translates to:
 *  PASSTHRU[F, fn[x] => x.f]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class C {
  String test = "Lily was here";
}

typedef CAlias1 = C;
typedef CAlias2 = C?;

main() {
  CAlias1 c1 = new C();
  Expect.equals("Lily was here", c1.test);

  CAlias1? c2 = new C();
  Expect.equals("Lily was here", c2.test);

  CAlias2 c3 = new C();
  Expect.equals("Lily was here", c3.test);

  CAlias2? c4 = new C();
  Expect.equals("Lily was here", c4.test);
}
