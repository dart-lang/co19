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

class A {
  C c = new C();
}

class C {
  String test = "Lily was here";
}

main() {
  C c = new C();
  Expect.equals("Lily was here", c.test);
  A? a = null;
  Expect.throws(() {a?.c.test;}, (e) => e is NoSuchMethodError);
  a = new A();
  Expect.equals("Lily was here", a?.c.test);
}
