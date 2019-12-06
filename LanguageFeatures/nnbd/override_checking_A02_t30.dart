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
 * opted-in method can return non-nullable value.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";
import "../../Utils/expect.dart";

class A1 implements A {
  int test_return_nullable() => 2;

  Null test_return_never() => null;
  int? aField1 = 1;
  int? aField2 = 2;
  int? aField3 = 3;
  int? get get_field1 => -1;
  int? get get_field2 => -2;
  int? get get_field3 => -3;
  void set set_field1(int? i) {}
  void set set_field2(int? i) {}
  void set set_field3(int? i) {}
}

main() {
  Expect.equals(2, A1().test_return_nullable());
}
