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
 *  PASSTHRU[F, fn[x] => x.f]. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  A a1 = new A();
  Expect.equals("Let it be", a1.text);
  Expect.equals("Let it be", a1.text2);

  A? a2 = new A();
  if (a2 != null) {
    Expect.equals("Let it be", a2.text);
    Expect.equals("Let it be", a2.text2);
  }
}
