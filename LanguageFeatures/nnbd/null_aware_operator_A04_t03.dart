/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e translates to F then e.m(args) translates to:
 *  PASSTHRU[F, fn[x] => x.m(ARGS(args))]
 *
 * @description Check that if e translates to F then e.m(args) translates to:
 *  PASSTHRU[F, fn[x] => x.m(ARGS(args))]. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  A a1 = new A();
  Expect.equals("Lily was here", a1.test());

  A? a2 = new A();
  if (a2 != null) {
    Expect.equals("Lily was here", a2.test());
  }
}
