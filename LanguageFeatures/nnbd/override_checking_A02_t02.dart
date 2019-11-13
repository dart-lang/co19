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
 * @description Check that compiler error is thrown if opted-in class extends
 * legacy class and migrated method with non-nullable parameter overrides legacy
 * method which parameter is nullable.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

class A1 extends A {
  void test_nullable(int i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class A2 extends A {
  void test_nullable(int i);
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
