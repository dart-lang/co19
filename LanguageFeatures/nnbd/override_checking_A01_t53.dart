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
 * @description Check that if legacy class implements two classes with some
 * method (one or both classes are opted-in), legacy method can accept null
 * arguments and opted-in nullability annotations are ignored.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class AB implements A, B {
  void test_nullable(int i) {
    Expect.isNull(i);
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

class BC implements B, C {
  void test_nullable(int i) {
    Expect.isNull(i);
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

class AC implements A, C {
  void test_nullable(int i) {
    Expect.isNull(i);
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

abstract class A1 {
  void test_nullable(int i);
}

class AA1 implements A, A1 {
  void test_nullable(int i) {
    Expect.isNull(i);
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

class BA1 implements B, A1 {
  void test_nullable(int i) {
    Expect.isNull(i);
  }

  void test_required({int i = 2}) {}
  int test_return_nullable() => 2;
}

class CA1 implements C, A1 {
  void test_nullable(int i) {
    Expect.isNull(i);
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
  AB().test_nullable(null);
  BC().test_nullable(null);
  AC().test_nullable(null);
  AA1().test_nullable(null);
  BA1().test_nullable(null);
  CA1().test_nullable(null);
}
