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
 * migrated method with non-nullable parameter can override legacy method.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "override_checking_A02_opted_out_lib.dart";
import "../../../Utils/expect.dart";

class A with LEGACY_ARGS {
  void test_int(int i)           { Expect.equals(1, i); }
  void test_object(Object i)     { Expect.equals(1, i); }
  void test_function(Function i) { Expect.equals(testme, i); }
}

void testme() {}

main() {
  A a = A();

  a.test_int(1);
  a.test_object(1);
  a.test_function(testme);
}
