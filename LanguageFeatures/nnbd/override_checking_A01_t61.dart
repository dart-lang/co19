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
 * getter (one or both classes are opted-in), legacy setter can accept non-null
 * values if corresponding parent setter is of both nullable or non-nullable
 * type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

abstract class AA {
  void set set_field1(String str);
  void set set_field2(String str);
}

class A1 implements AA, A {
  void set set_field1(String str) {
    Expect.equals("legacy", str);
  }

  void set set_field2(String str) {
    Expect.equals("legacy", str);
  }

  String field1 = "a";
  String field2 = "b";
  String get get_field1 => field1;
  String get get_field2 => field2;
  int test_nullable(int i) => 4;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
  int test_return_nullable() => 1;
  Null test_return_never() => null;
}

main() {
  A1 a1 = A1();
  a1.set_field1 = "legacy";
  a1.set_field2 = "legacy";
}
