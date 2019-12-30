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
 * getter (one or both classes are opted-in), legacy getter can return null
 * values if corresponding parent field is of both nullable or non-nullable
 * type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

abstract class AA {
  String get get_field1;
  String get get_field2;
}

class A1 implements A, AA {
  String get get_field1 => null;
  String get get_field2 => null;

  String field1 = "a";
  String field2 = "b";
  void test_nullable(int i) {}
  void test_required({int i = 1}) {}
  void test_never(Null i) {}
  int test_return_nullable() => 1;
  Null test_return_never() => null;
  void set set_field1(String str) { field1 = str; }
  void set set_field2(String str) { field2 = str; }
}

main() {
  A1 a1 = A1();
  Expect.isNull(a1.get_field1);
  Expect.isNull(a1.get_field2);
}
