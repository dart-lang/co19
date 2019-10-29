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
 * test that migrated field with null annotations can override legacy field
 * (check case when class implements two classes with the same method names).
 *
 * @author iarkh@unipro.ru
*/
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

abstract class B {
  int? aField1;
}

class A1 implements A, B {
  int? aField1 = 0;

  int test_nullable(int? i) => 2;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
  int test_return_nullable() => 1;
  Null test_return_never() => null;
  int aField2 = 2;
  int aField3 = 3;
  int get get_field1 => -1;
  int get get_field2 => -2;
  int get get_field3 => -3;
  void set set_field1(int i) { aField1 = -1; }
  void set set_field2(int i) { aField1 = -2; }
  void set set_field3(int i) { aField1 = -3; }
}

class A2 implements A, B {
  int? aField1 = null;

  int test_nullable(int? i) => 2;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
  int test_return_nullable() => 1;
  Null test_return_never() => null;
  int aField2 = 2;
  int aField3 = 3;
  int get get_field1 => -1;
  int get get_field2 => -2;
  int get get_field3 => -3;
  void set set_field1(int i) { aField1 = -1; }
  void set set_field2(int i) { aField1 = -2; }
  void set set_field3(int i) { aField1 = -3; }
}

class A3 implements A, B {
  int? aField1;

  int test_nullable(int? i) => 2;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
  int test_return_nullable() => 1;
  Null test_return_never() => null;
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
  A1 a1 = A1();
  Expect.equals(0, a1.aField1);
  a1.aField1 = null;
  Expect.isNull(a1.aField1);

  A2 a2 = A2();
  Expect.isNull(a2.aField1);
  a2.aField1 = 4;
  Expect.equals(4, a2.aField1);

  A3 a3 = A3();
  a3.aField1 = 4;
  Expect.equals(4, a3.aField1);
  a3.aField1 = null;
  Expect.isNull(a3.aField1);
}
