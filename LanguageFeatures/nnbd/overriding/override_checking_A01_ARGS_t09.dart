/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
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
 * method can accept non-null arguments if corresponding parent method argument
 * is of nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A implements OPTED_NULLABLE_ARGS {
  void test_int     (int      i) { Expect.equals(1, i); }
  void test_object  (Object   o) { Expect.equals(1, o); }
  void test_dynamic (dynamic  d) { Expect.equals(1, d); }
  void test_futureOr(FutureOr f) { Expect.equals(1, f); }
  void test_function(Function f) { Expect.equals(testme, f); }

  void test_null(Null n) {}
}

void testme() {}

main() {
  A a = A();

  a.test_int     (1);
  a.test_object  (1);
  a.test_dynamic (1);
  a.test_futureOr(1);
  a.test_function(testme);
}
