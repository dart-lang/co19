/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 * @description Check that overriding works as expected in a migrated library -
 * test that migrated field with null annotations can override legacy field
 * ([extends] clause).
*/
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

class A1 extends A {
  int? aField1 = 0;
}

class A2 extends A {
  int? aField1 = null;
}

class A3 extends A {
  int? aField1;
}

main() {
  A1 a1 = A1();
  Expect.equals(0, a1.aField1);
  a1.aField1 = null;
  Expect.isNull(a1.aField1);

  A2 a2 = A2();
  Expect.isNull(a2.aField1);
  a2.aField1 = 4;
  Expect.equals(4, a2.aField1);

  A3 a3 = A3();
  a3.aField1 = 4;
  Expect.equals(4, a3.aField1);
  a3.aField1 = null;
  Expect.isNull(a3.aField1);
}
