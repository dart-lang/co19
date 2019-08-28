/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The assignment e1?.f = e2 translates to:
 *  SHORT[EXP(e1), fn[x] => x.f = EXP(e2)]
 *
 * @description Check that a property access e?.f translates to:
 *  SHORT[EXP(e), fn[x] => x.f]. Test legacy pre-NNBD types
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";
import "legacy_library_lib.dart";

main() {
  A? a1 = null;
  Expect.isNull(a1?.text = "Lily was here");
  Expect.isNull(a1);
  a1 = new A();
  Expect.equals("Lily was here", a1?.test = "Lily was here");
  Expect.equals("Lily was here", a1?.test);

  A a2 = new A();
  Expect.equals("Lily was here", a2?.test = "Lily was here"); /// static type warning
  Expect.equals("Lily was here", a2.test);
}
