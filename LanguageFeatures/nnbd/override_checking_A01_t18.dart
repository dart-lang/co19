/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In an unmigrated library, override checking is done using legacy
 * types. This means that an unmigrated library can bring together otherwise
 * incompatible methods. When choosing the most specific signature during
 * interface computation, all nullability and requiredness annotations are
 * ignored, and the [Never] type is treated as [Null].
 *
 * @description Check that if legacy class inplements opted-in class, legacy
 * method can accept non-null arguments if corresponding parent method argument
 * is of both nullable or non-nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 implements A {
  void test_nullable(int i) {
    Expect.equals(1, i);
  }

  void test_required({int i = 1}) {}
  void test_never(Null i) {}
  int test_return_nullable() => 1;
  Null test_return_never() => null;
  String field1 = "a";
  String field2 = "b";
  String get get_field1 => field1;
  String get get_field2 => field1;
  void set set_field1(String str) { field1 = str; }
  void set set_field2(String str) { field2 = str; }
}

class B1 implements B {
  int test_nullable(int i) {
    Expect.equals(1, i);
  }

  void test_required({int i}) {}
  int test_return_nullable() => 0;
}

class C1 implements C {
  void test_nullable(int i) {
    Expect.equals(1, i);
  }

  void test_required({int i = 1}) {}
  void test_never(Null i) {}
  int test_return_nullable() => 1;
  Null test_return_never() => null;
  String field1 = "a";
  String field2 = "b";
  String get get_field1 => field1;
  String get get_field2 => field1;
  void set set_field1(String str) { field1 = str; }
  void set set_field2(String str) { field2 = str; }
}

main() {
  A1().test_nullable(1);
  B1().test_nullable(1);
  C1().test_nullable(1);
}
