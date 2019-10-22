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
 * test that migrated method without [Never] parameter cannot override legacy
 * method with parameter of any type ([extends] clause).
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_opted_in_lib.dart";

class A1 extends A {
  int test_never(Never i) => 1;
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {}
