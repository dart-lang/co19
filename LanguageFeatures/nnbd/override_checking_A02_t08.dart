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
 * @description Check that if opted-in class extends legacy class, opted-in
 * getter of nullable type can override legacy getter.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

class A1 extends A {
  int? get get_field1 => 1;
  int? get get_field2 => null;
  int? get get_field3 => -3;
}

main() {
  A1 a1 = A1();
  Expect.equals(1, a1.get_field1);
  Expect.isNull(a1.get_field2);
  Expect.equals(-3, a1.get_field3);
}
