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
 * @description Check that if legacy class implements opted-in class, legacy
 * method can return null values independently on the nullable annotations in
 * the parent method.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 implements A {
  int test_return_nullable() => null;

  void test_nullable(int i) {}
  void test_required({int i = 1}) {}
  void test_never(Null i) {}
  Null test_return_never() => null;
  String field1 = "a";
  String field2 = "b";
  String get get_field1 => field1;
  String get get_field2 => field1;
  void set set_field1(String str) { field1 = str; }
  void set set_field2(String str) { field2 = str; }
}

class B1 implements B {
  int test_return_nullable() => null;

  void test_nullable(int i) {}
  void test_required({int i}) {}
}

class C1 implements C {
  int test_return_nullable() => null;

  void test_nullable(int i) {}
  void test_required({int i = 1}) {}
  void test_never(Null i) {}
  Null test_return_never() => null;
  String field1 = "a";
  String field2 = "b";
  String get get_field1 => field1;
  String get get_field2 => field1;
  void set set_field1(String str) { field1 = str; }
  void set set_field2(String str) { field2 = str; }
}

main() {
  Expect.isNull(A1().test_return_nullable());
  Expect.isNull(B1().test_return_nullable());
  Expect.isNull(C1().test_return_nullable());
}
