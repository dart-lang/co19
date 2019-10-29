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
 * @description Check that overriding works as expected in a migrated library -
 * test that migrated field without null annotations cannot override legacy
 * field ([with] clause).
 *
 * @author iarkh@unipro.ru
*/
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

class A1 with A {
  int aField1 = 0;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A2 with A {
  int aField1 = null;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A3 with A {
  int aField1;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {}
