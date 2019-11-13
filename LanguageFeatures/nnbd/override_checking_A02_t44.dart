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
 *
 * @description Check that if opted-in class is a mixin with legacy class, child
 * opted-in setter can have nullable argument and so accept null and non-null
 * values.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

class A1 with A {
  void set set_field1(int? i) {
    Expect.equals(1, i);
  }
  void set set_field2(int? i) {
    Expect.isNull(i);
  }
}

main() {
  A1 a = A1();
  a.set_field1 = 1;
  a.set_field1 = null;
}
