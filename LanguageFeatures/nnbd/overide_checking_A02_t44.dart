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
 * test that migrated setter with null annotations can override legacy getter
 * ([with] clause).
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

class A1 with A {
  int? aField1 = 1;
  int? aField2 = null;
  int? aField3;
  int? get get_field1 => aField1;
  int? get get_field2 => aField2;
  int? get get_field3 => aField3;
  void set set_field1(int? i) { aField1 = i; }
  void set set_field2(int? i) { aField2 = i; }
  void set set_field3(int? i) { aField3 = i; }
}

main() {
  A1 a = A1();

  a.set_field1 = 5;
  Expect.equals(5, a.aField1);
  a.set_field1 = null;
  Expect.isNull(a.aField1);

  a.set_field2 = 5;
  Expect.equals(5, a.aField2);
  a.set_field2 = null;
  Expect.isNull(a.aField2);

  a.set_field3 = 5;
  Expect.equals(5, a.aField3);
  a.set_field3 = null;
  Expect.isNull(a.aField3);
}
