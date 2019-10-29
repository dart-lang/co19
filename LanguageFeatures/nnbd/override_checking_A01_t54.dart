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
 * @description Check that when choosing the most specific signature during
 * interface computation, all requiredness annotations are ignored in unmigrated
 * library if method argument is not [null] (check the case when class
 * implements two classes with the same method names).
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class AB implements A, B {
  int test_required({int i = 1}) => 4;

  int test_nullable(int i) => 4;
  int test_never(Null i) => 1;
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
  int test_required({int i = 1}) => 5;

  int test_nullable(int i) => 5;
  int test_never(Null i) => 1;
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
  int test_required({int i = 1}) => 6;

  int test_nullable(int i) => 6;
  int test_never(Null i) => 1;
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
  int test_required({int i = 1});
}

class AA1 implements A, A1 {
  int test_required({int i = 1}) => 7;

  int test_nullable(int i) => 7;
  int test_never(Null i) => 1;
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
  int test_required({int i = 1}) => 8;

  int test_nullable(int i) => 8;
  int test_return_nullable() => 2;
}

class CA1 implements C, A1 {
  int test_required({int i = 1}) => 9;

  int test_nullable(int i) => 9;
  int test_never(Null i) => 1;
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
  Expect.equals(4, AB().test_required(i: 1));
  Expect.equals(5, BC().test_required(i: 1));
  Expect.equals(6, AC().test_required(i: 1));
  Expect.equals(7, AA1().test_required(i: 1));
  Expect.equals(8, BA1().test_required(i: 1));
  Expect.equals(9, CA1().test_required(i: 1));
}
