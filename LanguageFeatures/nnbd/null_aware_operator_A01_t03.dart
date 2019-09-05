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
 *  SHORT[EXP(e), fn[x] => x.f]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class A {
  String test = "Lily was here";
}

typedef AAlias1 = A?;
typedef AAlias2 = A;
typedef StringAlias1 = String?;
typedef StringAlias2 = String;

main() {
  AAlias1 a1 = null;
  Expect.isNull(a1?.test);
  a1 = new A();
  Expect.equals("Lily was here", a1?.test);

  StringAlias1 s = null;
  Expect.isNull(s?.hashCode);
  s = "Let it be";
  Expect.isNotNull(s?.hashCode);

  AAlias2 a2 = new A();
  Expect.equals("Lily was here", a2?.test);    /// static type warning

  StringAlias2 s2 = "Let it be";
  Expect.isNotNull(s2?.hashCode);    /// static type warning
}
