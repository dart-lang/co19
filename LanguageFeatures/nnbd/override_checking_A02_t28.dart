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
 * @description Check that if opted-in class implements legacy class, child
 * opted-in setter cannot have non-nullable argument.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

class A1 implements A {
  int? aField1 = 1;
  int? aField2 = null;
  int? aField3;
  int? get get_field1 => aField1;
  int? get get_field2 => aField2;
  int? get get_field3 => aField3;

  void set set_field1(int i) {}
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set set_field2(int i) {}
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set set_field3(int i) {}
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int test_return_nullable() => 1;
  Null test_return_never() => null;
}

main() {}
