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
 * @description Check that if opted-in class implements legacy class, migrated
 * method with required nullable parameter can override legacy method with named
 * parameter with and without default value.
 *
 * @Issue 40527
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

class A implements LEGACY_REQUIRED_ARGS {
  void test_default({required int? i})    { Expect.equals(1, i); }
  void test_nondefault({required int? i}) { Expect.equals(1, i); }
}

main() {
  A().test_default(i: 1);
  A().test_nondefault(i: 1);
}
