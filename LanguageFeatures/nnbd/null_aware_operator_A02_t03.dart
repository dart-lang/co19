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
 *  PASSTHRU[F, fn[x] => x.f]. Test type aliases
 * @author sgrekhov@unipro.ru
 * @static-warning
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class A {
  C c = new C();
}

class C {
  String test = "Lily was here";
}

typedef AAlias1 = A?;
typedef AAlias2 = A;
typedef CAlias = C;

main() {
  CAlias c = new C();
  Expect.equals("Lily was here", c.test);
  AAlias1 a1 = null;
  Expect.throws(() {a1?.c.test;}, (e) => e is NoSuchMethodError);
  a1 = new A();
  Expect.equals("Lily was here", a1?.c.test);

  AAlias2? a2 = null;
  Expect.throws(() {a2?.c.test;}, (e) => e is NoSuchMethodError);
  a2 = new A();
  Expect.equals("Lily was here", a2?.c.test);

  AAlias2 a3 = new A();
  Expect.equals("Lily was here", a3?.c.test); /// static type warning
}
