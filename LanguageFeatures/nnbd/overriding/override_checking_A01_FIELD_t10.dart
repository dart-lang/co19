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
 * field can accept non-null values if corresponding parent field is of nullable
 * type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A implements OPTED_NULLABLE_FIELD {
  int i       = 1;
  Object o    = 1;
  dynamic d   = 1;
  Function f  = testme1;
  FutureOr fo = 1;
  Null n      = null;
  void v;
}

main() {
  A a = A();
  Expect.equals(1, a.i);
  Expect.equals(1, a.o);
  Expect.equals(1, a.d);
  Expect.equals(testme1, a.f);
  Expect.equals(1, a.fo);
}
