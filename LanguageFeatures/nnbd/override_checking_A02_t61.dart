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
 * @description Check that if opted-in class implements two classes (one is
 * legacy) with some setter, opted-in setter of nullable type can override
 * legacy setter.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

abstract class B {
  void set set_field1(int? i);
  void set set_field2(int? i);
  void set set_field3(int? i);
}

class A1 implements A, B {
  int? aField1 = 1;
  int? aField2 = null;
  int? aField3;
  void set set_field1(int? i) {
    Expect.equals(5, i);
  }
  void set set_field2(int? i) {
    Expect.isNull(i);
  }
  void set set_field3(int? i) {}

  int? get get_field1 => aField1;
  int? get get_field2 => aField2;
  int? get get_field3 => aField3;
  void test_required({int? i = 1}) {}
  void test_never(Null i) {}
  int test_return_nullable() => 1;
  Null test_return_never() => null;
}

main() {
  A1 a = A1();
  a.set_field1 = 5;
  a.set_field2 = null;
}
