/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1?.[e2] translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)]]
 *
 * @description Check that if e1 translates to F then e1?.[e2] translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)]]. Test legacy pre-NNBD types
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";
import "legacy_library_lib.dart";

main() {
  A? a1 = null;
  Expect.isNull(a1?.[42]);
  a1 = new A();
  Expect.equals(42, a1?.[42]);

  A a2 = new A();
  Expect.equals(42, a2?.[42]);   /// static type warning
}
