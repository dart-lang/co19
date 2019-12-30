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
 * @description Check that if legacy class is a mixin with opted-in class,
 * legacy field can accept [null] values if corresponding parent field is of
 * both nullable or non-nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 with A {
  String field1 = "c";
  String field2 = "d";
}

class A2 with A {
  String field1 = null;
  String field2 = null;
}

class A3 with A {
  String field1;
  String field2;
}

main() {
  A1 a1 = A1();
  a1.field1 = null;
  Expect.isNull(a1.field1);
  a1.field2 = null;
  Expect.isNull(a1.field2);

  A2 a2 = A2();
  Expect.isNull(a2.field1);
  Expect.isNull(a2.field2);

  A3 a3 = A3();
  Expect.isNull(a3.field1);
  Expect.isNull(a3.field2);
}
