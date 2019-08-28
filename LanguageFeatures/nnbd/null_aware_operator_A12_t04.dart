/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1?.[e2] = e3 translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]
 *
 * @description Check that if e1 translates to F then e1?.[e2] = e3 translates
 * to: SHORT[EXP(e1), fn[x] => x[EXP(e2)] = EXP(e3)]. Test legacy pre-NNBD types
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";
import "legacy_library_lib.dart";

main() {
  A? a1 = null;
  Expect.isNull(a1?.[42] = 13);
  a1 = new A();
  Expect.equals(13, a1?.[42] = 13);

  A a2 = new A();
  Expect.equals(13, a2[42] = 13);   /// static type warning

}