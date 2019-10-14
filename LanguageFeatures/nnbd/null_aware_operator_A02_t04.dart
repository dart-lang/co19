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
 * @static-warning
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";
import "legacy_library_lib.dart";

main() {
  AMx c = new AMx();
  Expect.equals("No woman, no cry", c.text);

  A? a1 = null;
  Expect.throws(() {a1?.c.text;}, (e) => e is NoSuchMethodError);
  a1 = new A();
  Expect.equals("No woman, no cry", a1?.c.text);

  A a2 = new A();
  Expect.equals("No woman, no cry", a2?.c.text); /// static type warning
}
