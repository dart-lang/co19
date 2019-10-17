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
 *  PASSTHRU[F, fn[x] => x.f]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class C {
  String test = "Lily was here";
}

main() {
  C c1 = new C();
  Expect.equals("Lily was here", c1.test);

  C? c2 = new C();
  if (c2 != null) {
    Expect.equals("Lily was here", c2.test);
  }
}
