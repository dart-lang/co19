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
 * @description Check that when choosing the most specific method signature
 * during interface computation, [Never] method return value is treated as
 * [Null] in legacy library (check the case when class implements two classes
 * with the same method name).
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

abstract class AA {
  Null test_return_never();
}

class A1 implements A, AA {
  Null test_return_never() => null;

  int test_return_nullable() => 6;
  int test_nullable(int i) => 6;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;
  String field1 = "a";
  String field2 = "b";
  String get get_field1 => field1;
  String get get_field2 => field1;
  void set set_field1(String str) { field1 = str; }
  void set set_field2(String str) { field2 = str; }
}

main() {
  Expect.isNull(A1().test_return_never());
}
