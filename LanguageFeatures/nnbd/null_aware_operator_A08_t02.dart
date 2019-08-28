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
 *  SHORT[EXP(e), fn[x] => x.f]
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {
  String test = "No woman";
}

main() {
  A a = new A();
  Expect.equals("no cry", a?.test = "no cry");    /// static type warning
  Expect.equals("no cry", a.test);
}
