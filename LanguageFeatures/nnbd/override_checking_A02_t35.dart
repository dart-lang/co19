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
 * @description Check that if opted-in class is a mixin with legacy class,
 * opted-in method parameter can be of nullable type and the method can accept
 * non-null and null arguments.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

class A1 with A {
  void test_nullable(int? i) {
    Expect.equals(1, i);
  }
}

class A2 with A {
  void test_nullable(int? i) {
    Expect.isNull(i);
  }
}

main() {
  A1().test_nullable(1);
  A2().test_nullable(null);
}
