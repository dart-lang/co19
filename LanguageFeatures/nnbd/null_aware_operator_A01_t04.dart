/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A property access e?.f translates to:
 *  SHORT[EXP(e), fn[x] => x.f]
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
  Expect.isNull(a1?.text);
  a1 = new A();
  Expect.equals("Let it be", a1?.text);

  A a2 = Never;
  Expect.isNotNull(a2?.hashCode);    /// static type warning
  a2 = new A();
  Expect.equals("Let it be", a2?.text);    /// static type warning
}
