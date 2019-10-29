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
 * @description Check that when choosing the most specific method signature
 * during interface computation, all nullability annotations are ignored in
 * unmigrated library for the class method return value if it is [null]
 * ([implements] clause).
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 implements A {
  int test_return_nullable() => null;

  int test_nullable(int i) => 4;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
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

  int test_nullable(int i) => 5;
  int test_required({int i}) => 2;
}

class C1 implements C {
  int test_return_nullable() => null;

  int test_nullable(int i) => 6;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
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
