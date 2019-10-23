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
 * test that migrated method with [Never] return value cannot be called even if
 * it overrides legacy method ([implements] clause).
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

class A1 implements A {
  Never test_return_never() => throw "It's impossible!";

  int test_nullable(int? i) => 2;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
  int test_return_nullable() => 1;
  int aField1 = 1;
  int aField2 = 2;
  int aField3 = 3;
  int get get_field1 => -1;
  int get get_field2 => -2;
  int get get_field3 => -3;
  void set set_field1(int i) { aField1 = -1; }
  void set set_field2(int i) { aField1 = -2; }
  void set set_field3(int i) { aField1 = -3; }
}

main() {
  A1 a = A1();
  var i = a.test_return_never();
//          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
