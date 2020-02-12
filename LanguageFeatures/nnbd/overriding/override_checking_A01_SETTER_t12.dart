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
 * setter can accept non-null values if corresponding parent setter is of the
 * [Never] type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A1 implements OPTED_NEVER_SETTER {
  void set setNever(int i) { Expect.equals(1, i); }
}

class A2 implements OPTED_NEVER_SETTER {
  void set setNever(dynamic d) { Expect.equals(1, d); }
}

class A3 implements OPTED_NEVER_SETTER {
  void set setNever(Object o) { Expect.equals(1, o); }
}

class A4 implements OPTED_NEVER_SETTER {
  void set setNever(FutureOr f) { Expect.equals(1, f); }
}

class A5 implements OPTED_NEVER_SETTER {
  void set setNever(Function f) { Expect.equals(testme1, f); }
}

main() {
  A1().setNever = 1;
  A2().setNever = 1;
  A3().setNever = 1;
  A4().setNever = 1;
  A5().setNever = testme1;
}
